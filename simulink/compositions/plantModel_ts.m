clear
clc
close all

%% local functions
Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];


%% rapp kite parameters
refArea = 3;
refSpan = 5.5;
refChord = 0.55;
mass = 36.8;
Jmat = [25 0 -.47;0 32 0; -.47 0 56];

%% tether parameters
dTet = 0.0025;
tetCD = 1.2;
rhoTet = 0.0046; %kg/m
TetKspring = 10243; %N/m

%% environment parameters
rhoAir   = 1.225; %kg/m^3
gravAccl = 9.81;

%% test parameters
% init azimuth
init_azim = 0;
init_elev = 30;
init_rad  = 500;

sphToCar = @(az,el,r) r*[cosd(az)*cosd(el);sind(az)*cosd(el);-sind(el)];

% initial conditions
init_G_rKite = sphToCar(init_azim,init_elev,init_rad);
init_OwB     = [0;0;0];
init_Euler   = [0;90-init_elev;160]*pi/180;
init_G_vKite = [0;0;0];
init_B_vKite = Rx(init_Euler(1))*Ry(init_Euler(2))*Rz(init_Euler(3))*...
    init_G_vKite;

% inputs
csDef   = [0;0;0]*pi/180;
G_vWind = [10;0;0];
thrL    = norm(init_G_rKite);
thrDL   = 0; 
