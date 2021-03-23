clear
clc
close all

%% local functions
Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];


%% path parameters
pathWidth = 60;
pathHeight = pathWidth/5;
pathElev   = 30;
pathRad    = 100;
forwardLen = 0.05;
initPathVar = 0.05*2*pi;

%% rapp kite parameters
mass = 36.8;

%% airleron gains
aileron_kp  = 1;
aileron_ki  = 0;
aileron_kd  = 0;
aileron_tau = 0.5;

%% test parameters
init_speed = 50;
[init_G_rKite,init_Euler,init_G_vKite,init_OwB,init_Az,init_El] = ...
    getInitConditions(initPathVar,pathWidth,pathHeight,pathElev,pathRad,init_speed);
init_G_rKite = init_G_rKite + 10*rand(3,1);

TcO = Ry(init_El+pi/2)*Rz(init_Az);
BcO = Rx(init_Euler(1))*Ry(init_Euler(2))*Rz(init_Euler(3));

F_aero = [0;0;1000];


