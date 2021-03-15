function [cXa,cXq,cXde,cX0] = calculateAeroCoeff(a)

pF = @(c0,c1,c2,a) c2*a.^2 + c1*a + c0;

cXa = pF(0,8.32,0,a);
cXq = pF(-0.6,4.41,0,a);
cXde = pF(-0.01,0.11,0,a);
cX0  = pF(0.46,0,0,a);



end