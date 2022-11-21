%% LATERAL CONTROL

% Roll Control
RollCtrl.P = 1.5;
RollCtrl.I = 0.15;
RollCtrl.D = 0;
RollCtrl.damping = 0.2;
RollCtrl.saturation = 50;

% Heading control
HeadingCtrl.P = 200/30;
HeadingCtrl.I = 145/30;
HeadingCtrl.D = 69/30;
HeadingCtrl.rate = 0.05;

%% LONGITUDINAL CONTROL
% Pitch Control
PitchCtrl.P = 2;
PitchCtrl.I = 0.1;
PitchCtrl.accPID.P = 3;
PitchCtrl.accPID.I = 1;
PitchCtrl.filter = 5;
PitchCtrl.damping = 0.5;
PitchCtrl.saturation.upper = 10;
PitchCtrl.saturation.lower = -15;

% Altitude Control
AltCtrl.errPID.P = 1;
AltCtrl.errPID.I = 0.1;
AltCtrl.errPID.D = 0;
AltCtrl.accPID.P = 1;
AltCtrl.accPID.I = 2;
AltCtrl.accPID.D = 0.05;
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
