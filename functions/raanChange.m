## Copyright (C) 2021 Thanapat Chotipun

function dv = raanChange (nu, r,alt,draan,i)
  dv = (pi^2) * (sqrt(nu*r+alt)*draan*sin(i))
endfunction
