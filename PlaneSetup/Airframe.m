plane.Airframe.S = 19.478;
plane.Airframe.A = 34.86;
plane.Airframe.MAC = plane.Airframe.A/plane.Airframe.S;
plane.Airframe.Mass = 4000;
plane.Airframe.CG = [0,0,0]';
plane.Airframe.CP = [0,0,0]';
plane.Airframe.I = [4,0,-0.14;0,3.6,0;-0.14,0,9.55]*4000;