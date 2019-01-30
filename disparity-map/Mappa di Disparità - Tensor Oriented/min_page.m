%input M, matrice di p pagine
%output m, numero della pagina di norma minima
function m=min_page(M)

[m,n,p]=size(M);

M2=M.^2;%quadrato di M

sm2=zeros(1,p);
for k=1:p
    sm2(k)=sum(sum(M2(:,:,k)));%memorizzazione della somma dei quadrati
end

[vm,pm]=min(sm2);%estrazione del minimo delle somme dei quadrati

m=pm;