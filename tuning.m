%% LATERAL CONTROL

% Roll Control
RollCtrl.P = 1;
RollCtrl.I = 0;
RollCtrl.D = 0;
RollCtrl.damping = 0;

%% LONGITUDINAL CONTROL
% Pitch Control
PitchCtrl.P = 1.0224393073205*0.9;
PitchCtrl.I = 0.0357890292942185*4;
PitchCtrl.D = 0;
PitchCtrl.saturation.upper = deg2rad(10);
PitchCtrl.saturation.lower = deg2rad(-15);
PitchCtrl.damping = 0.2;

% Altitude Control
AltCtrl.P = 0;
AltCtrl.I = 0;
AltCtrl.D = 0;
AltCtrl.damping = 0;

% Airspeed Control
AirspdCtrl.P = 0;
AirspdCtrl.I = 0;
AirspdCtrl.D = 0;
AirspdCtrl.double_integration = 0;

fprintf("Control coefficients loaded.\n")
