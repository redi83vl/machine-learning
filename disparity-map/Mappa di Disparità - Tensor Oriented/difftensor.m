function D=difftensor(UA,UB)
[mu,nu,pu]=size(UA);
D=zeros(mu,nu);
%somma degli elementi dei tensori
SA=sum(UA,3).^2;
SB=sum(UB,3).^2;
%SAD dei tensori
D=abs(SA-SB);
