clear
% close all

a = linspace(-25,25,501);
b = 0;
da = 0*pi/180;
de = 0*pi/180;
dr = 0*pi/180;
pH = 0;
qH = 0;
rH = 2;

WcB = @(a,b) [cos(a)*cos(b) sin(b) sin(a)*sin(b);...
    -cos(a)*sin(b) cos(b) -sin(a)*sin(b);
    -sin(a) 0 cos(a)];

Ry = @(y) [cos(y) 0 -sin(y); 0 1 0; sin(y) 0 cos(y)];

[CX,CY,CZ,CL,CM,CN] = calculateAeroCoeff(a(:)*pi/180,b,da,de,dr,pH,qH,rH);

DCL = [0;0;0].*a;

for ii = 1:length(a)
    
DCL(:,ii) = Ry(a(ii)*pi/180)*[CX(ii);CY(ii);CZ(ii)];

DCL(:,ii) = DCL(:,ii).*[-1;1;-1];

end

subplot(3,3,1); plot(a,CX); ylabel('CX');

subplot(3,3,2); plot(a,CY); ylabel('CY');

subplot(3,3,3); plot(a,CZ); ylabel('CZ');

subplot(3,3,4); plot(a,CL); ylabel('CL');

subplot(3,3,5); plot(a,CM); ylabel('CM');

subplot(3,3,6); plot(a,CN); ylabel('CN');

subplot(3,3,7); plot(a,DCL(1,:)); ylabel('D');

subplot(3,3,8); plot(a,DCL(2,:)); ylabel('C');

subplot(3,3,9); plot(a,DCL(3,:)); ylabel('L');

% figure
% plot(a,DCL(3,:)./max(eps,abs(DCL(1,:)))); ylabel('L/D');


allAxes = findall(0,'type','axes');
set(allAxes,'FontSize',9);
xlabel(allAxes,'AoA [deg]');
grid(allAxes,'on');
hold(allAxes,'on');
xlim(allAxes,[min(a) max(a)]);
