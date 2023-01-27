function [altitude_req, heading_req, airspeed_req, pitch_req, manual_pitch_ctrl, next_stage, eval_time, cache] = Requester(altitude_act, heading_act, airspeed_act, pitch_act, NED_act, time, prev_state)

%% Initialize, read and update state
prev_altitude_req = prev_state(1);
prev_heading_req = prev_state(2);
prev_airspeed_req = prev_state(3);
prev_pitch_req = prev_state(4);
prev_manual_pitch_ctrl = prev_state(5);
stage = prev_state(6);
time_step = time - prev_state(7);
cache = prev_state(8);

eval_time = time;
altitude_req = prev_altitude_req;
heading_req = prev_heading_req;
airspeed_req = prev_airspeed_req;
pitch_req = prev_pitch_req;
manual_pitch_ctrl = prev_manual_pitch_ctrl;
pos_x = NED_act(1);
pox_y = NED_act(2);

if (stage == 0)
    altitude_req = 500;
    heading_req = 0.0;
    airspeed_req = 70;
    pitch_req = 0.0;
    manual_pitch_ctrl = 0.0;
    next_stage = 1;
    next_stage = 3; % fixme landing model
    cache = 0;
    return
end
%%

%% 1: Rollout
if stage >= 1 && stage < 2
    altitude_req = 0;
    heading_req = 0.0;
    airspeed_req = 42 * 1.3;

    if airspeed_req >= (42 * 1.3) - 2
        stage = 2;
    end
end

%% 2: Takeoff
if stage >= 2 && stage < 3
    heading_req = 0.0;
    airspeed_req = 60;
    altitude_req = ramp_progressive(0.1, prev_altitude_req, time_step, 0.5);
    if altitude_act >= 10
        stage = 3;
    end
end

%% 3: Climb
if stage >= 3 && stage < 4
    altitude_req = 500;
    airspeed_req = 70;

    if is_within_tolerance(altitude_act, 500, 5) && is_within_tolerance(airspeed_act, 70, 5)
        stage = 4;
    end
end

%% 4: Circle
if stage >= 4 && stage < 5
    if stage == 4 % first turn
        heading_req = wrapToPi(ramp_limited(deg2rad(1), prev_heading_req, time_step, deg2rad(180)));
        if heading_req == deg2rad(180)
            stage = 4.1;
        end
    elseif stage == 4.1 % level flight to approach point
        heading_req = deg2rad(180);
        if is_within_tolerance(pos_x, -15000, 1) % 15 km south of runway
            stage = 4.2;
        end
    elseif stage == 4.2 % second turn
        heading_req = wrapToPi(ramp_limited(deg2rad(1), prev_heading_req, time_step, 8000));
        if heading_req >= deg2rad(0)
            heading_req = 0;
            stage = 5;
        end
    end
end

%% 5: Approach
if (stage >= 5 && stage < 6)
    heading_req = 0;
    %todo

    if pos_x >= -1 * glide_slope_offset(3, altitude_req)
        stage = 6;
    end
end

%% 6: Glideslope
if (stage >= 6 && stage < 7)
    airspeed_req = ramp_limited(-0.1, prev_airspeed_req, time_step, 42 * 1.3);
    altitude_req = ramp(glide_slope_rate(3, airspeed_act), prev_altitude_req, time_step);

    if (altitude_act <= 21 + 1)
        altitude_req = 21;
        stage = 7;
    elseif (altitude_act <= 21 + 10)
        ramp(glide_slope_rate(1, airspeed_req), prev_altitude_req, time_step);
    end
end

%% 7: Flare
if (stage >= 7 && stage < 8)
    if stage == 7 % init
        manual_pitch_ctrl = 1;
        prev_pitch_req = pitch_act;
        stage = 7.1;
    end

    pitch_req = ramp_limited(deg2rad(0.5), prev_pitch_req, time_step, deg2rad(5));
    
    if stage == 7.1 && pitch_act >= deg2rad(5) % init
        stage = 7.2;
    end

    if stage == 7.2
        % simple P controller for throtle
        vert_speed = (altitude_act - cache) / time_step;
        airspeed_req = (0.5 - vert_speed) * 50;
        airspeed_req = min(airspeed_req, 65);
        airspeed_req = max(airspeed_req, 1.1 * 42);
        cache = altitude_act; % to get vertical speed
    end

    if altitude_act <= 1 % touchdown
        stage = 8;
    end
end

%% 8: Braking
if (stage >= 8 && stage < 9)
    manual_pitch_ctrl = 1;
    pitch_req = ramp_limited(-deg2rad(1), prev_pitch_req, time_step, 0);
    airspeed_req = 0;
end

%%
next_stage = stage;
end % Requester

%% FUNCTIONS
function req = ramp(rate, prev_req, time_step)
    req = prev_req + time_step * rate;
end

function req = ramp_limited(rate, prev_req, time_step, limit)
    req = prev_req + time_step * rate;
    if rate > 0
        req = min(req, limit);
    else
        req = max(req, limit);
    end
end

function req = ramp_progressive(rate, prev_req, time_step, progress)
    req = prev_req + time_step * (rate + progress/time_step);
end

function vertical_speed = glide_slope_rate(angle, airspeed)
    vertical_speed = -1 * tand(angle) * airspeed;
end


function horizontal_offset = glide_slope_offset(angle, altitude)
    horizontal_offset = altitude / tand(angle);
end

function ret = is_within_tolerance(actual_val, required_value, tolerance)
    tolerance = tolerance / 100;
    if (required_value + abs(required_value * tolerance) >= actual_val) && (actual_val >= required_value - abs(required_value * tolerance) )
        ret = true;
    else
        ret = false;
    end
end
