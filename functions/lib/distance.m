function [d,dis] = distance(p1,p2)
  dis = p2-p1;
  d = sqrt(sum(dis.**2));
endfunction
  