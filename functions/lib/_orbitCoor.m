## Copyright (C) 2021 Thanapat Chotipun

function [u,x,y,z] = _orbitCoor (T,r,trans,org,center=false)
  u = [cos(T)*r sin(T)*r 0] * trans + org;
  x = u(1);
  y = u(2);
  z = u(3);
endfunction
