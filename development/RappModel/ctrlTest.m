clear
clc
close all

%% plot path and dome
cIn = maneuverabilityAdvanced;
cIn.meanElevationInRadians = 30*pi/180;
cIn.pathWidth = 60;
cIn.pathHeight = 20;
cIn.tetherLength = 100;

pathVar = 2*pi*linspace(0,1,51);

cIn.plotDome; axis equal;
[~,pathCords] = cIn.plotLemniscate(pathVar);
view(125,20)

% find closest point on path equation
tParam = 0.75*2*pi;
arbPoint = cIn.eqPathCoordinates(cIn.aBooth,cIn.bBooth,...
                cIn.meanElevationInRadians,tParam,cIn.tetherLength);


firstDir = cIn.eqxKdXP_1stDir(cIn.aBooth,cIn.bBooth,cIn.meanElevationInRadians,pathVar,...
    cIn.tetherLength,arbPoint(1),arbPoint(2),arbPoint(3));

secondDir = cIn.eqxKdXP_2ndDir(cIn.aBooth,cIn.bBooth,cIn.meanElevationInRadians,pathVar,...
    cIn.tetherLength,arbPoint(1),arbPoint(2),arbPoint(3));

% test newton's
startPt = tParam + rand*2;
x(1) = startPt;
for ii = 1:10
    
    NewtFirstDir(ii) = cIn.eqxKdXP_1stDir(cIn.aBooth,cIn.bBooth,cIn.meanElevationInRadians,x(ii),...
        cIn.tetherLength,arbPoint(1),arbPoint(2),arbPoint(3));
    
    NewtSecondDir(ii) = cIn.eqxKdXP_2ndDir(cIn.aBooth,cIn.bBooth,cIn.meanElevationInRadians,x(ii),...
        cIn.tetherLength,arbPoint(1),arbPoint(2),arbPoint(3));

    x(ii+1) = x(ii) - NewtFirstDir(ii)/NewtSecondDir(ii);
   
end
startPtCd = cIn.eqPathCoordinates(cIn.aBooth,cIn.bBooth,...
                cIn.meanElevationInRadians,startPt,cIn.tetherLength);
finPoint = cIn.eqPathCoordinates(cIn.aBooth,cIn.bBooth,...
                cIn.meanElevationInRadians,x(end),cIn.tetherLength);

scatter3(arbPoint(1),arbPoint(2),arbPoint(3),'b*');
scatter3(startPtCd(1),startPtCd(2),startPtCd(3),'r*');
scatter3(finPoint(1),finPoint(2),finPoint(3),'ro');











