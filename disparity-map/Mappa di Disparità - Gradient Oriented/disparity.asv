%input L, immagine snistra
%input R, immagine destra
%input md, massima disparità cacolabile
function DM=disparity(L,R,md)

[m,n,p]=size(L);
if(~(p==3))
    error('Sono ammesse solo immagini a triplo colore.');
end

%calcolo dei moduli dei gradienti
GL=gradmod(L);
GR=gradmod(R);

g=fspecial('gaussian',3,2);
GL=imfilter(GL,g);
GR=imfilter(GR,g);

DS=disparities(GL,GR,md);

[m,n,d]=size(DS);

DM=zeros(m,n);

for i=2:m-1 
    clc;
    fprintf('\nElaborazione mappa di disparita: %i%%\n',ceil(100*i/m))
    for j=2:n-1
        wind=DS(i-1:i+1,j-1:j+1,:);
        disp=min_page(wind);
        DM(i,j)=disp;
    end
end