function [x,y,z] = createPlanet(a,e,n=40)
  [x,y,z] = ellipsoid(0,0,0,a,a,a-a*e,n);
endfunction
