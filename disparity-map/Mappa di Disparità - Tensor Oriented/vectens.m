%input M, matrice dell'immagine m-n-1/m-n-3
%output U, matrice m-n-3/m-n-5 vettori dei tensori Uij=[Ix;Iy;I]/
%Uij=[I'x;I'y;Ir;Ig;Ib] e il tensore è dato da Tij=U'*U

function UM=vectens(M)

[m,n,p]=size(M);

if p==1 
    UM=zeros(m,n,3);
    %calcolo delle derivate direzionali
    [Mx,My]=gradient(M);
    %assegnazione degli elementi del vettore U
    UM(:,:,1)=imfilter(Mx,fspecial('gaussian',3,1));
    UM(:,:,2)=imfilter(My,fspecial('gaussian',3,1));
    UM(:,:,3)=imfilter(M,fspecial('gaussian',3,1));
elseif p==3
    UM=zeros(m,n,5);
    Mz=1/3*(M(:,:,1)+M(:,:,2)+M(:,:,3));
    %calcolo delle derivate direzionali
    [Mx,My]=gradient(Mz);
    %assegnazione degli elementi del vettore U
    UM(:,:,1)=imfilter(Mx,fspecial('gaussian',3,1));
    UM(:,:,2)=imfilter(My,fspecial('gaussian',3,1));;
    UM(:,:,3)=imfilter(M(:,:,1),fspecial('gaussian',3,1));
    UM(:,:,4)=imfilter(M(:,:,2),fspecial('gaussian',3,1));
    UM(:,:,5)=imfilter(M(:,:,3),fspecial('gaussian',3,1));
end