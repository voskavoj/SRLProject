horizontal1x = linspace(0,1000,2);horizontal1y = linspace(0,0,2);horizontal1z = linspace(1000,1000,2); horizontal1v = [70,70];

turn1x = cos(deg2rad(-90:10:90))*250+1000; turn1y = sin(deg2rad(-90:10:90))*250+250; turn1z = ones(1,19)*1000; turn1v = ones(1,19)*70;

climbx = linspace(1000,-44000,500);climby = ones(1,500)*500; climbz = linspace(1000,3500,500);climbv = linspace(70,110,500);

turn2x = cos(deg2rad(90:10:270)).*linspace(250,250,19)+climbx(end);turn2y = sin(deg2rad(90:10:270)).*linspace(250,250,19)+climby(end)-250;turn2z = ones(1,19)*3500;turn2v = ones(1,19)*110; 

decentx = linspace(turn2x(end),-14000,333);decenty = ones(1,333)*0; decentz = linspace(3500,2500,333); decentv = linspace(110,70,333);

turns = 6.5;
angles = deg2rad(-90:10:(90+turns*360));
turnradius = linspace(500,250,length(angles)/2);
turnradius = [turnradius,linspace(250,500,length(angles)/2+1)];
turn3x = cos(angles).*turnradius-14000; turn3y = sin(angles).*turnradius+500; turn3z = linspace(2500,500,length(turn3x)); turn3v =linspace(70,50,length(turn3x));

horizontal2x = linspace(turn3x(end),turn3x(end)+1000,2);horizontal2y = linspace(0,0,2);horizontal2z = linspace(500,500,2);horizontal2v = [50,50];

x = [horizontal1x,turn1x,climbx,turn2x,decentx,turn3x,horizontal2x];
y = [horizontal1y,turn1y,climby,turn2y,decenty,turn3y,horizontal2y];
z = [horizontal1z,turn1z,climbz,turn2z,decentz,turn3z,horizontal2z];
v = [horizontal1v,turn1v,climbv,turn2v,decentv,turn3v,horizontal2v];