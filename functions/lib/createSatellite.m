## Copyright (C) 2021 Thanapat Chotipun

function [e_anomaly,m_anomaly,t_anomaly,coordinate,r,velocity,energy] =  createSatellite(t,T,a,e,trans,org,nu,m,mode="ti")
  trans = reshape(trans,3,3);
  if mode=="th"
    theta = mod(t,2*pi);
    e_anomaly = _orbitEcc(e,theta);
    m_anomaly = _orbitMe(e,e_anomaly);
    t_anomaly = _orbitTrue(e_anomaly,e);
  else
    m_anomaly = 2*pi*(mod(t,T)/T);
    [e_anomaly,t_anomaly] = _orbitAnomaly(m_anomaly,e);
  endif
  r = _orbitRadius(e,a,t_anomaly);
  coordinate = _orbitCoor(t_anomaly,r,trans,org,center=true);
  velocity = _orbitVelocity(a,r,nu);
  energy = _orbitEnergy(nu,a);
  
  
endfunction
