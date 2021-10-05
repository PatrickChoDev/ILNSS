## Copyright (C) 2021 Thanapat Chotipun

function ecc = _orbitEcc (epsilon, theta)
  ecc = 2*atan(sqrt((1-epsilon)/(1+epsilon))*tan(theta/2));
endfunction
