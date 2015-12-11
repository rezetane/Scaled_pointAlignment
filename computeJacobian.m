function J=computeJacobian(i,x,X,Z)
  J=zeros(2,4);
  J(1:2,1:2)=eye(2);
  c=X(1,1);
  s=X(2,1);
  Rprime=[-s, -c; c, -s]; %# derivative of the rotation matrix w.r.t theta
  pi=Z(1:2,i);
  R=[cos(x(3)), -sin(x(3)); sin(x(3)), cos(x(3))];
  J(1:2,3)=Rprime * pi;
  J(1:2,4)=R*pi;
  
end
