plane.Aerodynamic.CL0 = 0.2778;
plane.Aerodynamic.dCLdAoA = 2*pi;

plane.Aerodynamic.CD0 = 0.045;%0.05;
plane.Aerodynamic.CDmin = 0.3;
plane.Aerodynamic.dCDdCL = 0.15;

plane.Aerodynamic.dClAoS = -19.6889;%-1e-1;
plane.Aerodynamic.dClY = -1e1*3.7*1.8*2*2*5;
plane.Aerodynamic.dClP = -177.5483;%-1e3;

plane.Aerodynamic.Cm0 = 0.250;
plane.Aerodynamic.dCmCL = -0.8999;
plane.Aerodynamic.dCmQ = -16.8/2;

plane.Aerodynamic.CnAoS = 0.3495;%1e-2;
plane.Aerodynamic.dCnY = -10.4897;%-100;
plane.Aerodynamic.dCnP = 1e0*3*1.25*0.85;

plane.Aerodynamic.C2M = [-3.6,3.6,0,0;0,0,3.4,0;0,0,0,0.4];
plane.Aerodynamic.C2CL = -[1,1,2,0]*0.01;
plane.Aerodynamic.C2CD = [1,1,1,1]*0.1;

