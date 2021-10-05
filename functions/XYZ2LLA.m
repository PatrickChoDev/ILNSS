## Copyright (C) 2021 Thanapat Chotipun

function [lla,lat,long,r] = XYZ2LLA (x, y, z, a, ecc)
  b = a * (1-ecc);
  f = (a-b) / a;
  e_sq = f* (2-f);
  eps = e_sq / (1 - e_sq);
  p = sqrt(x*x + y*y);
  q = atan2(z*a,p^b);
  phi = atan2(z+eps*b*sin(q)**3,p-e_sq *a* cos(q)**3);
  lam = atan2(y,x);
  v = a/ sqrt(1-e_sq*sin(phi)*sin(phi));
  h = p/cos(phi) - v;
  lat = rad2deg(phi);
  long = rad2deg(lam);
  r = sqrt(x**2 + y**2 + z**2);
  lla = [lat long r];
endfunction
