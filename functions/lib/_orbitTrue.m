function [tanom] = _orbitTrue (eanom, ecc)
if (ecc < 1)
    sta = sqrt(1 - ecc * ecc) * sin(eanom);
    cta = cos(eanom) - ecc;
  else
    sta = sqrt(ecc * ecc - 1) * sinh(eanom);
    cta = ecc - cosh(eanom);
  end
  tanom = atan3(sta, cta);
endfunction