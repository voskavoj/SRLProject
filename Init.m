clear all
% Determine where your m-file's folder is.
folder = fileparts(which(mfilename)); 
% Add that folder plus all subfolders to the path.
addpath(genpath(folder));
clear folder
Airframe;
Aerodynamic;
Powertrain;
AerodynamicSurfaces;
Initial;
Trim;
tuning;

system_is_initialized = true;
