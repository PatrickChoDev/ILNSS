## Copyright (C) 2021 Thanapat Chotipun

function [v1,v2,dv] = hohmannOrbit (r1, r2, nu)
  format long
  v1 = sqrt(nu/r1) * (sqrt(2*r2/(r1+r2)) - 1)
  v2 = sqrt(nu/r2) * (1 - sqrt(2*r1/(r1+r2)))
  dv = v1 + v2
  tH = pi*sqrt((r1+r2)^3/(8*nu))
  w2 = sqrt(nu/r2^3)
  a = pi - w2*tH
endfunction
