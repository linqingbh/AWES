clear
clc

Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];

syms roll pitch yaw AoA Beta AZ EL

AcB = Rz(Beta)*Ry(-AoA);

BcO = matlabFunction( simplify(Rx(roll)*Ry(pitch)*Rz(yaw)));


TcO = simplify(Ry(-(EL + pi/2))*Rz(AZ));

%% test
pitch = 15*pi/180;
yaw   = 30*pi/180;
roll  = 0*pi/180;

BcO = Rx(roll)*Ry(pitch)*Rz(yaw)


