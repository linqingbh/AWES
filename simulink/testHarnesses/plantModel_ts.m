clear
clc

%% kite parameters
mKite = 36.8;
jKite = [25 0 -0.47; 0 32 0; -0.47 0 56];
refSpan = 5.5;
refChord = 0.55;
refArea  = 3;

%% environment parameters
gravAccl = 9.81;
rho      = 1.225;

%% simulation parameters
init_O_rKite = [0;0;-200];
init_B_vKite = [5;0;0];
init_Euler   = [0;0;0];
init_OwB     = [0;0;0];

%% wind speed
O_vWind = [0;0;0];

