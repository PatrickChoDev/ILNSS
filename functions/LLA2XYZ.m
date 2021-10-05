## Copyright (C) 2021 Thanapat Chotipun

function [u,x,y,z]  = LLA2XYZ (latitude, longitude,altitude,R,e)
  cosLat = cos(latitude * pi / 180);
  sinLat = sin(latitude * pi / 180);
  cosLong = cos(longitude * pi / 180);
  sinLong = sin(longitude * pi / 180);
  phi = R / sqrt(1-e**2*(sinLat**2));
  x = (phi + altitude)*cosLat*cosLong;
  y = (phi + altitude)*cosLat*sinLong;
  z = (phi + altitude)*sinLat;
  u = [x y z];
endfunction
