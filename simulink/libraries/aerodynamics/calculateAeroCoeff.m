function [CX,CY,CZ,CL,CM,CN] = calculateAeroCoeff(a,b,da,de,dr,pH,qH,rH)

pF = @(c0,c1,c2,a) c2*a.^2 + c1*a + c0;

%% CX
cXa  = pF(0.46,8.32,0,a);
cXq  = pF(-0.6,4.41,0,a);
cXde = pF(-0.01,0.11,0,a);

CX   = -1*(cXa.*a + cXq.*qH + cXde.*de);

%% CY
cYb  = pF(-.19,0,0,a);
cYp  = pF(-.10,0,0,a);
cYr  = pF(0.17,0.14,0,a);
cYda = pF(-.05,0,0,a);
cYdr = pF(.1,0,0,a);

CY   = cYb.*b + cYp.*pH + cYr.*rH + cYda.*da + cYdr.*dr;

%% CZ
cZa  = pF(-5.4,1.23,10.2,a);
cZq  = pF(-7.56,0.13,6.15,a);
cZde = pF(-.32,0,0.29,a);

CZ   = 1*(cZa.*a + cZq.*qH + cZde.*de);

%% CL
cLb  = pF(-.06,0,0,a);
cLp  = pF(-.56,0,0,a);
cLr  = pF(.18,.65,0,a);
cLda = pF(-.25,.04,0,a);
cLdr = pF(0,0,0,a);

CL   = 1*(cLb.*b + cLp.*pH + cLr.*rH + cLda.*da + cLdr.*dr);

%% CM
cMa  = pF(-.32,.21,0,a);
cMq  = pF(-11.30,0,5.29,a);
cMde = pF(-1.02,0,0,a);

CM   = cMa.*a + cMq.*qH + cMde.*de;

%% CN
cNb  = pF(0.06,-.09,0,a);
cNp  = pF(-.06,-.91,0,a);
cNr  = pF(-.05,0,0,a);
cNda = pF(.02,-.12,0,a);
cNdr = pF(-.04,0,0,a);

CN   = 1*(cNb.*b + cNp.*pH + cNr.*rH + cNda.*da + cNdr.*dr);

end