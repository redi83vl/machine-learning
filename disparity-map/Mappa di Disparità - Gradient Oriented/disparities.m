%input L, immagine sinistra ( m x n )
%input R, immagne destra ( m x n )
%input md, disparit� massima da calcolare
%output DS, collezione delle disparit� ( m x n x md )

function DS=disparities(L,R,md)

[m,n,p]=size(L);

DS=zeros(m,n,1);

for i=1:md
    clc;
    fprintf('\n Calcolo differenza per disparit�: %i\n',i);
    %shifting dell'immagine destra
    SR=right_shift(R,i);
    %disfferenza assoluta fra immagine sinistra e destra shiftata
    D=SR-L;
    %matrice della i-esima disparit�
    DSi = D(:,:,1).^2 + D(:,:,2).^2 + D(:,:,3).^2;
    %aggiunnta del risultato
    DS(:,:,i)=DSi;
end