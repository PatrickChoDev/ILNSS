## Copyright (C) 2021 Thanapat Chotipun

function meanAnomaly = _orbitMe (epsilon, ecc)
  meanAnomaly = ecc - epsilon*sin(ecc);
endfunction
