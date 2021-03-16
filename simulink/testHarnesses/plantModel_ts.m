clear
clc

Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];

syms PH TH PS AoA Beta AZ EL

AcB = Rz(Beta)*Ry(-AoA);

BcO = matlabFunction( simplify(Rx(PH)*Ry(TH)*Rz(PS)));

TcO = matlabFunction(simplify(Ry(-(EL + pi/2))*Rz(AZ)));


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
init_azimuth = 0*pi/180;
init_elev    = 90*pi/180;
sphereRad    = 200;
init_O_rKite = TcO(init_azimuth,init_elev)'*[0;0;-sphereRad];
init_B_vKite = [0;0;0];
init_Euler   = [0;pi/2 - init_elev;pi];
init_OwB     = [0;0;0];

%% wind speed
O_vWind = [20;0;0];

