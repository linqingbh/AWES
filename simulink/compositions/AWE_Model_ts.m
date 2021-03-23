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
G_vWind = [10;0;0];

%% path parameters
pathWidth = 60;
pathHeight = pathWidth/5;
pathElev   = 30;
pathRad    = 100;
forwardLen = 0.05;
initPathVar = 0.05*2*pi;

%% airleron gains
aileron_kp  = 1;
aileron_ki  = 0;
aileron_kd  = 0;
aileron_tau = 0.5;

%% test parameters
% initial conditions
init_speed = 8*norm(G_vWind);
[init_G_rKite,init_Euler,init_G_vKite,init_OwB,init_Az,init_El] = ...
    getInitConditions(initPathVar,pathWidth,pathHeight,pathElev,pathRad,init_speed);

% inputs
csDef   = [0;0;0]*pi/180;
thrL    = norm(init_G_rKite);
thrDL   = 0; 


