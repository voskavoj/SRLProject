% load model
lin_model = load("linearized_model.mat");
lin_model = lin_model.linsys1;

% split into simpler models
elevator_to_pitch_ang = lin_model(5, 3);

% responses
step(elevator_to_pitch_ang, 10);

% launch rltool
rltool(elevator_to_pitch_ang)