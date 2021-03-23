clear
clc
close all


Rx = @(x) [1 0 0; 0 cos(x) sin(x); 0 -sin(x) cos(x)];
Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];
Rz = @(z) [cos(z) sin(z) 0; -sin(z) cos(z) 0; 0 0 1];

%% rapp kite parameters
refArea = 3;
refSpan = 5.5;
refChord = 0.55;
rhoAir = 1.225; %kg/m^3

%% test parameters
timeVal = linspace(0,pi,101);
% kite velocity
O_vKx = 0.1;
O_vKz = 0.0268*cos(timeVal+pi);
O_vKite(3,:) = O_vKz;
O_vKite(1,:) = O_vKx; 
O_vKite_ts = timeseries(O_vKite,timeVal);
% wind
O_vWind = [0;0;0];
% apparent vel
O_vApp = O_vWind - O_vKite;
% euler
Euler = [0;180;0]*pi/180;
BcO = Rx(Euler(1))*Ry(Euler(2))*Rz(Euler(3));

%% test aerodynamic coefficient calculations
a = atan(O_vApp(3,:)./O_vApp(1,:))*180/pi;
b = 0;
vA = norm(O_vApp);
OwB = [0;0;0];
csDef  = [0;0;0]*pi/180;

for ii = 1:length(a)
[Fcoeff(:,ii),Mcoeff(:,ii)] = calcAeroCoefficients(a(ii)*pi/180,...
    b,vA,OwB,refChord,refSpan,csDef);

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