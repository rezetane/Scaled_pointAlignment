function [xes,chis,H,b,es]=pointAlignerLoop(x,Z, iterations)
  xes=zeros(4,iterations);
  Js=zeros(2,4*iterations);
  es=zeros(2,iterations);
  chis=zeros(1,iterations);
  xnew=x;
  z=1;
  for i=1:iterations
    [xnew,chiNew, H,b,e]=pointAlignerIteration(xnew,Z);
    xes(:,i)=xnew;
    chis(1,i)=chiNew;
    es(:,i)=e;

end
  