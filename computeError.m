% # computes the error of a 2D point seen from a position X
% #
% # Z is the 4 x N matrix of the measurements.
% #   each column of Z contains two observations about the same point
% #   the first two components of a column denote the point seen from the origin
% #   the second two components denote a point seen from the observer position
% #
% # i s the point number
% #
% # X is the homogeneous 2D transformation matrix that expresses the position
% # of the origin w.r.t the observer

function e=computeError(i,X,Z)
  pi=ones(3,1);
  pj=ones(3,1);
  pi(1:2)=Z(1:2,i);
  pj(1:2)=Z(3:4,i);
  efull = X*pi- pj;
  
  e=efull(1:2);
end
