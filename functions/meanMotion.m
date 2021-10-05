## Copyright (C) 2021 Thanapat Chotipun

function n = meanMotion (M,m,a)
   G = 6.674e-14;
   n = sqrt(G*(M+m)/a^3)
endfunction
