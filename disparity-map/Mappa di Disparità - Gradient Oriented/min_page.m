function m=min_page(M)

[m,n,p]=size(M);

M2=M.^2;

sm2=zeros(1,p);
for k=1:p
    sm2(k)=sum(sum(M2(:,:,k)));
end

[vm,pm]=min(sm2);

m=pm;