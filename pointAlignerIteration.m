function [xNew, chi, H,b,er]=pointAlignerIteration(x,Z)
  H=zeros(4,4);
  b=zeros(4,1);
  X=v2t(x); 
  chi=0;
%   #loop through the measurements and update the
%    #accumulators
   Omega = [1 0; 0 1];

  for i=1:size(Z,2)
    e=computeError(i,X,Z);
    J=computeJacobian(i,x,X,Z);
    H=H+J'*Omega*J;
    b=b+J'*Omega*e;
    chi=chi+e'*Omega*e;


  end
  dX=-H\b;


    xNew=x+dX;
    thetaNew = xNew(3);
% % %   %# fix the wraparound
    thetaNew = atan2(sin(thetaNew), cos(thetaNew));
    xNew(3)=thetaNew;
    er=computeError(i,X,Z);
end