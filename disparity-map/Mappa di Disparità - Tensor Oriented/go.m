clear;
pack;

L=imread('imm/tsul.tif');
R=imread('imm/tsur.tif');

[DMLR,DMRL]=dispmap(L,R,70,1);

subplot(2,2,1), imagesc(L),title('Immagine sinistra.');
subplot(2,2,2), imagesc(R),title('Immagine destra.');
subplot(2,2,3), imagesc(DMLR), title('Mappa di disparità sinistra.');
subplot(2,2,4), imagesc(DMRL), title('Mappa di disparità destra.');