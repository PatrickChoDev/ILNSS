## Copyright (C) 2021 Thanapat Chotipun

function dv = incChange (inc,ecc,w,f,M,m,a)
  dv = (2*sin(deg2rad(inc/2))*sqrt(1-ecc^2)*cos(deg2rad(w+f))*meanMotion(M,m,a)*a)/(1+ecc*cos(f))
endfunction
