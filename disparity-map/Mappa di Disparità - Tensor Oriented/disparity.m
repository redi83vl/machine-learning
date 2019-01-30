%la funzione calcola la disparità riferita a L 
%input L, immagine sinistra
%input R, immagine destra
%input md, massima disoarità presunta
%input wd, dimensione finestra di verifica 2*wd+1

function DM=disparity(L,R,md,wd)

[m,n,p]=size(L);

%cacolo dei vettori U del tensore di struttura
UL=vectens(L);
UR=vectens(R);

fprintf('\nElaborazione delle disparità incrementali...')
DS=disparities(UL,UR,md);
[m,n,d]=size(DS);
DM=zeros(m,n);

fprintf('\nElaborazione mappa di disparita finale...')
for i=wd+1:m-wd
    for j=wd+1:n-wd
        wind=DS(i-wd:i+wd,j-wd:j+wd,:);
        disp=min_page(wind);
        DM(i,j)=disp;
    end
end
fprintf('\n')