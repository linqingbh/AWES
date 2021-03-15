clear
clc

Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];

syms PH TH PS AoA Beta

AcB = Rz(Beta)*Ry(-AoA);

BcO = matlabFunction( simplify(Rx(PH)*Ry(TH)*Rz(PS)));

