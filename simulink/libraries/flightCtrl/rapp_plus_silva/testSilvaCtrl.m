clear
% clc
close all

rng(2)

%% test parameters
cIn = maneuverabilityAdvanced;
cIn.meanElevationInRadians = 30*pi/180;
cIn.pathWidth = 60;
cIn.pathHeight = 20;
cIn.tetherLength = 100;

% kite velocity
G_vK = 10*[0;1;1];


%% test newton's closest path var calculation
% start point
startPt = 1*0.75*2*pi; 
L1 = 0.05;

% add random pertubrabtion
kiteLoc = cIn.eqPathCoordinates(cIn.aBooth,cIn.bBooth,...
    cIn.meanElevationInRadians,startPt,cIn.tetherLength) - rand(3,1)*10; 


[sCls,pG,sInt,tPt,eta] = findIntersectionPoint(cIn.aBooth,cIn.bBooth,...
    cIn.meanElevationInRadians,startPt,kiteLoc,G_vK,L1);

clsPt = pG*cIn.tetherLength;

tgtPt = tPt*cIn.tetherLength;


pathVar = 2*pi*linspace(0,1,101);
hd = cIn.eqPathHeading(cIn.aBooth,cIn.bBooth,...
    cIn.meanElevationInRadians,pathVar,cIn.tetherLength);
cIn.plotDome; axis equal;
[~,pathCords] = cIn.plotLemniscate(pathVar);
view(125,20)
scatter3(kiteLoc(1),kiteLoc(2),kiteLoc(3),'b*');
scatter3(clsPt(1),clsPt(2),clsPt(3),'ro');
scatter3(tgtPt(1),tgtPt(2),tgtPt(3),'mo');







