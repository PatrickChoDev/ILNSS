## Copyright (C) 2021 Thanapat Chotipun
addpath('./lib')
_init
clf
defineVar
grid on
xlim([-4000 4000])
ylim([-4000 4000])
zlim([-4000 4000])
set(gca,'view',[60,30])
hold on
[p_x,p_y,p_z] = createPlanet(p_a,p_e);
if p_isDot==true
  plot_planet = plot3(0,0,0,'ob');
  hold on
else
  plot_planet = surf(p_x,p_y,p_z);
  hold on 
endif
p_phi = p_T/360*step;


for t = 0:tick
  # Create Orbit
  [o_org,o_trans,o_x,o_y,o_z]=createOrbit(o_a,o_e,o_i,o_O+p_phi*t,o_w);
  for i = 1:size(o_org)(2)
    if t > 0
        delete(plot_o(i))
      endif
    plot_o(i) = plot3(o_x(:,i),o_y(:,i),o_z(:,i),'g2');
  endfor

  #Create Observer
  obs_c = LLA2XYZ(obs_lat,obs_long-p_phi*t,obs_alt,p_a,p_e);

  # Create Satellites
  o_T = _orbitPeriod(p_nu,o_a) / 60 / 60 / 24;
  subT = o_T/o_n;
  sat_phi = o_T/360*step;
  v=0;
  for i = 1:size(o_w)(2)
    for j = 1:o_n
      [e_anomaly,m_anomaly,t_anomaly,coordinate,r,velocity,energy] = createSatellite((j-1)*subT+sat_phi*t,o_T,o_a,o_e,o_trans(i,:,:),o_org(i,:),p_nu,p_m,mode="ti");
      s_i(i,j,:) = [e_anomaly,m_anomaly,t_anomaly,r,velocity,energy];
      s_c(i,j,:) = coordinate;
      s_lla(i,j,:) = XYZ2LLA(coordinate(1),coordinate(2),coordinate(3),o_a,o_e);
      d = distance(coordinate,obs_c);
      angle = pi/2 - acos((sum(coordinate.*obs_c) / sqrt(sum(coordinate.^2)) / sqrt(sum(obs_c.^2)) ));
      a = rad2deg(asin(sin(angle)/d*distance(coordinate,[0 0 0])));
      if t > 0
        delete(plot_sat(i,j))
      endif
      if a > 20 && a < 100
        if j==1
          plot_sat(i,j) = plot3([obs_c(1) coordinate(1)],[obs_c(2) coordinate(2)],[obs_c(3) coordinate(3)],'*-b');
        else
          plot_sat(i,j) = plot3([obs_c(1) coordinate(1)],[obs_c(2) coordinate(2)],[obs_c(3) coordinate(3)],'*-r');
        endif
        v = v+1;
      else
        if j==1
          plot_sat(i,j) = plot3(coordinate(1),coordinate(2),coordinate(3),'*','color','blue');
        else
          plot_sat(i,j) = plot3(coordinate(1),coordinate(2),coordinate(3),'*','color','black');
        endif
      endif
    endfor
  endfor
  title(cstrcat(["Visible sat "],[num2str(v)]))
  print(cstrcat(['../exported/anim-'],sprintf( '%03d', t ),['.png']),'-dpng','-r100');
  pause(delay)
endfor