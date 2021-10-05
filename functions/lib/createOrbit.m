## Copyright (C) 2021 Thanapat Chotipun

function [origin,trans,x,y,z] =  createOrbit (a,e,i,o,w,center=false)
  b = a*sqrt(1-e^2);
  t = linspace(0,2*pi,1e+3);
  X = a*cos(t);
  Y = b*sin(t);
  at = atan2(0,2*a);
  x = (2*a)/2 + X*cos(at) - Y*sin(at) - a;
  y = (2*a)/2 + X*sin(at) + Y*cos(at) - a;
  z = zeros(size(x));
  f = e*a;
  mat = repmat([x;y;z]',1,1,size(w)(2));
  for j = 1:size(w)(2)
    trans(j,:,:) = roty(i(j))*rotz(o(j))*rotx(w(j));
    for it = 1:size(x)(2)
      mat(it,:,j) = mat(it,:,j)*reshape(trans(j,:),3,3);
    endfor
    if center==false
      origin(j,:) = [-f,0,0]*reshape(trans(j,:),3,3);
      for it = 1:size(x)(2)
        mat(it,:,j) = mat(it,:,j)+origin(j,:);
      endfor
    else
      origin(j,:) = [0,0,0]
    endif
  endfor
  x = reshape(mat(:,1,:),[],size(w)(2));
  y = reshape(mat(:,2,:),[],size(w)(2));
  z = reshape(mat(:,3,:),[],size(w)(2));
endfunction