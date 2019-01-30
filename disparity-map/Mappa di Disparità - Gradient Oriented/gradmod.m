function GM=gradmod(M)

[m,n,p]=size(M);
M=double(M);

GM=zeros(m,n,p);

for k=1:p
    [Gx,Gy]=gradient(M(:,:,k));
    GM(:,:,k)=sqrt(Gx.^2+Gy.^2);
end