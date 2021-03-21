function [forceCoeff,momentCoeff] = aeroCoefficients(a,b,vA,angVel,refChord,...
    refSpan,csDef)
%AEROCOEFFICIENTS Summary of this function goes here
%   Detailed explanation goes here

alphaMat  = [a^2 a 1]';
angVelVec = ([refSpan;refChord;refSpan].*angVel(:))./(2*max(eps,norm(vA)));
dAileron  = csDef(1);
dElevator = csDef(2);
dRudder   = csDef(3);

%% dimensionless polynomial coefficients
% CX
CX0  = [2.5549 0.4784 -0.0293]*alphaMat;
CXb  = 0;
CXp  = 0;
CXq  = [0 4.4124 -0.6029]*alphaMat;
CXr  = 0;
CXda = 0;
CXde = [0 0.1115 -0.0106]*alphaMat;
CXdr = 0;

% CY
CY0  = 0;
CYb  = [0.0936 -0.0299 -0.1855]*alphaMat;
CYp  = [0.0496 -0.0140 -0.1022]*alphaMat;
CYq  = 0;
CYr  = [0 0.1368 0.1694]*alphaMat;
CYda = [0.0579 -0.0024 -0.0514]*alphaMat;
CYde = 0;
CYdr = [-0.1036 0.0268 0.10325]*alphaMat;

% CZ
CZ0  = [5.7736 -5.0676 -0.5526]*alphaMat;
CZb  = 0;
CZp  = 0;
CZq  = [6.1486 0.1251 -7.5560]*alphaMat;
CZr  = 0;
CZda = 0;
CZde = [0.2923 -0.0013 -0.315]*alphaMat;
CZdr = 0;

% CM
CM0  = [0 -0.6027 -0.0307]*alphaMat;
CMb  = 0;
CMp  = 0;
CMq  = [5.2885 -0.0026 -11.3022]*alphaMat;
CMr  = 0;
CMda = 0;
CMde = [0.9974 -0.0061 -1.0427]*alphaMat;
CMdr = [0 0 -0.0015]*alphaMat;

% CL
CL0  = 0;
CLb  = [0.0312 -0.0003 -0.0630]*alphaMat;
CLp  = [0.2813 -0.0247 -0.5632]*alphaMat;
CLq  = 0;
CLr  = [0 0.6448 0.1811]*alphaMat;
CLda = [0.2383 -0.0087 -0.2489]*alphaMat;
CLde = 0;
CLdr = [0 -0.0013 0.00436]*alphaMat;

% CN
CN0  = 0;
CNb  = [0 -0.0849 0.0577]*alphaMat;
CNp  = [0 -0.9137 -0.0565]*alphaMat;
CNq  = 0;
CNr  = [0.02570 0.0290 -0.0553]*alphaMat;
CNda = [0 -0.1147 0.01903]*alphaMat;
CNde = 0;
CNdr = [0.04089 -0.0117 -0.0404]*alphaMat;

% angular velocity coeff matrices
forceAngVel = [CXp CXq CXr; CYp CYq CYr; CZp CZq CZr];
momentAngVel= [CLp CLq CLr; CMp CMq CMr; CNp CNq CNr];

forceCoeff = [CX0;CY0;CZ0] + ...
    [CXb;CYb;CZb]*b + ...           % sideslip contribution
    forceAngVel*angVelVec + ...     % angular velocity contribution
    [CXda;CYda;CZda]*dAileron + ... % aileron contribution
    [CXde;CYde;CZde]*dElevator +... % elevator contribution
    [CXdr;CYdr;CZdr]*dRudder;       % rudder contribution

momentCoeff = [CL0;CM0;CN0] + ...
    [CLb;CMb;CNb]*b + ...           % sideslip contribution
    momentAngVel*angVelVec + ...    % angular velocity contribution
    [CLda;CMda;CNda]*dAileron + ... % aileron contribution
    [CLde;CMde;CNde]*dElevator +... % elevator contribution
    [CLdr;CMdr;CNdr]*dRudder;       % rudder contribution


end

