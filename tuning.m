%% LATERAL CONTROL
clearvars RollCtrl SlipDamp HeadingCtrl PitchCtrl AltCtrl AirspdCtrl var
% Roll Control
RollCtrl.P = 1.5;
RollCtrl.I = 0.15;
RollCtrl.D = 0;
RollCtrl.damping = 0.2;
RollCtrl.saturation = 50;

% Slip damper
SlipDamp.PID.P = 10;
SlipDamp.PID.I = 1;
SlipDamp.PID.saturation = 5;
SlipDamp.damping = 0.01;

% Heading control
HeadingCtrl.errPID.P = 6.7;
HeadingCtrl.errPID.I = 4.8;
HeadingCtrl.errPID.D = 2.3;
HeadingCtrl.accPID.P = 3;
HeadingCtrl.accPID.I = 0;
HeadingCtrl.accPID.D = 0.04;
HeadingCtrl.rate = 0.05;
HeadingCtrl.filter.fc = 2;

%% LONGITUDINAL CONTROL
% Pitch Control
PitchCtrl.P = 4;
PitchCtrl.I = 0.2;
PitchCtrl.damping = 0.5;
PitchCtrl.saturation.upper = 10;
PitchCtrl.saturation.lower = -15;

% Altitude Control
AltCtrl.errPID.P = 0.5;
AltCtrl.errPID.I = 0.005;
AltCtrl.errPID.D = 0.0;
AltCtrl.accPID.P = 0.06;
AltCtrl.accPID.I = 0.005;
AltCtrl.accPID.D = 0.01;
AltCtrl.rate.rising = 3;
AltCtrl.rate.falling = -10;
AltCtrl.filter.fc = 20;

% Airspeed Control
AirspdCtrl.P = 100;
AirspdCtrl.I = 10;
AirspdCtrl.double_integration = 0;
AirspdCtrl.saturation.upper = 40;
AirspdCtrl.saturation.lower = -30;

fprintf("Control coefficients loaded.\n")
