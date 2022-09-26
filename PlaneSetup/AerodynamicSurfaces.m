plane.ailerons.DeflectionSat = deg2rad([30,-30]); % [rad] maximální výchylka
plane.ailerons.TimeConstant = 0.01; % [s] čas náběhu motoru
plane.ailerons.SpeedRateSaturation = deg2rad([120,-120]); % [rad/s] maximal change of deflection per second

plane.elevator.DeflectionSat = deg2rad([30,-30]); % [rad] maximální výchylka
plane.elevator.TimeConstant = 0.01; % [s] čas náběhu motoru
plane.elevator.SpeedRateSaturation = deg2rad([120,-120]); % [rad/s] maximal change of deflection per second

plane.rudder.DeflectionSat = deg2rad([30,-30]); % [rad] maximální výchylka
plane.rudder.TimeConstant = 0.01; % [s] čas náběhu motoru
plane.rudder.SpeedRateSaturation = deg2rad([120,-120]); % [rad/s] maximal change of deflection per second