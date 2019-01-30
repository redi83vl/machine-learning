clear;
pack;
L=imread('imm/tsul.tif');
% L=imresize(L,0.2);
R=imread('imm/tsur.tif');
% R=imresize(R,0.2);


tic
%calcolo della mappa di disparità L su R
DMLR=disparity(L,R,70);
%calcolo della mappa di disparità R su L
for i=1:3
    L(:,:,i)=fliplr(L(:,:,i));
    R(:,:,i)=fliplr(R(:,:,i));
end
DMRL=disparity(R,L,70);
DMRL=fliplr(DMRL);
t=toc

clc;
fprintf('\nTempo impiegato: %i secondi\n',uint8(t));

%rendering dei risultati
figure(1)
imagesc(DMLR)
title('Mappa di disparita riferita all''immagine sinistra')

figure(2)
imagesc(DMRL)
title('Mappa di disparita riferita all''immagine destra')





