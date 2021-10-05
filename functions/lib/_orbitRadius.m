## Copyright (C) 2021 Thanapat Chotipun

function r = _orbitRadius (e, a, T)
  r = a*(1-e**2)/(1+e*cos(T));
endfunction
