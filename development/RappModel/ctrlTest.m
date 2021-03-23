clear
% clc
close all

rng(2)

%% test parameters
cIn = maneuverabilityAdvanced;
cIn.meanElevationInRadians = 30*pi/180;
cIn.pathWidth = 60;
cIn.pathHeight = 20;
cIn.tetherLength = 1;

% kite velocity
G_vK = 10*[0;1;1];


%% test newton's closest path var calculation
% start point
startPt = 1*0.75*2*pi; 
delta0 = 1;
% add random pertubrabtion
kiteLoc = cIn.eqPathCoordinates(cIn.aBooth,cIn.bBooth,...
    cIn.meanElevationInRadians,startPt,cIn.tetherLength) + rand(3,1)*10; 

[kiteAz,kiteEl,sphRad] = calcTangentialCord(kiteLoc);

% get xT and yT
pG = kiteLoc./norm(kiteLoc);
[exT,eyT,vkT] = getxT_yT(kiteAz,kiteEl,G_vK,kiteLoc);

% find closet path var
[clsPathVar,clsPoint,tanPt] = findClosestPoint(cIn.aBooth,cIn.bBooth,...
    cIn.meanElevationInRadians,startPt,pG);

% calculate delta
deltaVal = max(acos(dot(clsPoint,pG)),eps);

% calculate bG
bG = (clsPoint - cos(deltaVal)*pG)/sin(deltaVal);

% calculate Dxi
[dxT,ddt_dxT] = calcDeltaXiAndItsDerivative(tanPt,clsPoint,pG,vkT,deltaVal,delta0);




% pathVar = 2*pi*linspace(0,1,101);
% cIn.plotDome; axis equal;
% [~,pathCords] = cIn.plotLemniscate(pathVar);
% view(125,20)
% scatter3(kiteLoc(1),kiteLoc(2),kiteLoc(3),'b*');
% quiver3(kiteLoc(1),kiteLoc(2),kiteLoc(3),G_vK(1),G_vK(2),G_vK(3));
% scatter3(clsPoint(1),clsPoint(2),clsPoint(3),'ro');







