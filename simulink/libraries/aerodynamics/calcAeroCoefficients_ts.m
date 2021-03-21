clear
clc
close all

%% rapp kite parameters
refArea = 3;
refSpan = 5.5;
refChord = 0.55;
mass = 36.8;
Jmat = [25 0 -.47;0 32 0; -.47 0 56];
dTet = 0.0025;
rhoTet = 0.0046; %kg/m
tetCD = 1.2;
rhoAir = 1.225; %kg/m^3

%% test parameters
kiteVelInG = [-10;0;-1];
windVelInG = [0;0;0];
angVel     = [0;0;0];
csDef      = [0;0;0]*pi/180;
yawPitchRoll = [0;0;0]*pi/180;


%% test aerodynamic coefficient calculations
a = linspace(-15,15,101);
b = 0;
vA = 10;
angVel = [0;0;0];
csDef  = [0;0;0]*pi/180;

for ii = 1:length(a)
[Fcoeff(:,ii),Mcoeff(:,ii)] = calcAeroCoefficients(a(ii)*pi/180,...
    b,vA,angVel,refChord,refSpan,csDef);

end

nP = [2,3];

subplot(nP(1),nP(2),1); plot(a,Fcoeff(1,:)); ylabel('CX');
subplot(nP(1),nP(2),2); plot(a,Fcoeff(2,:)); ylabel('CY');
subplot(nP(1),nP(2),3); plot(a,Fcoeff(3,:)); ylabel('CZ');

subplot(nP(1),nP(2),4); plot(a,Mcoeff(1,:)); ylabel('CL');
subplot(nP(1),nP(2),5); plot(a,Mcoeff(2,:)); ylabel('CM');
subplot(nP(1),nP(2),6); plot(a,Mcoeff(3,:)); ylabel('CN');

% subplot(nP(1),nP(2),7); plot(a,DCL(1,:)); ylabel('D');
% subplot(nP(1),nP(2),8); plot(a,DCL(2,:)); ylabel('C');
% subplot(nP(1),nP(2),9); plot(a,DCL(3,:)); ylabel('L');

% figure
% plot(a,DCL(3,:)./max(eps,abs(DCL(1,:)))); ylabel('L/D');


allAxes = findall(0,'type','axes');
set(allAxes,'FontSize',9);
xlabel(allAxes,'AoA [deg]');
grid(allAxes,'on');
hold(allAxes,'on');
xlim(allAxes,[min(a) max(a)]);
linkaxes(allAxes,'x');