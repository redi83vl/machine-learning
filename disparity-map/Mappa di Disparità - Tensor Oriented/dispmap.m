%la funzione calcola la disparità riferita a L e a R 
%input L, immagine sinistra
%input R, immagine destra
%input md, massima disoarità presunta
%input wd, dimensione finestra di verifica 2*wd+1

function [DML,DMR]=dispmap(L,R,md,wd)

[m,n,p]=size(L);

fprintf('\nProcesso inizializzato:\n')
fprintf('Dimensione immagine: %i per %i',m,n)
if p==1
    fprintf(' grigia\n')
elseif p==3
    fprintf(' a colori\n')
end
fprintf('Disparità massimma presunta: %i\n',md)

L=double(L);
R=double(R);

fprintf('\nCalcolo riferito all''immagine sinistra...')
tic
DML=disparity(L,R,md,wd);
t=toc;
fprintf('tempo impiegato %i secondi\n',ceil(t));

fprintf('\nCalcolo riferito all''immagine destra...')
tic
for i=1:3
    Lf(:,:,i)=fliplr(L(:,:,i));
    Rf(:,:,i)=fliplr(R(:,:,i));
end
DMR=disparity(Rf,Lf,md,wd);
DMR=fliplr(DMR);
t=toc;
fprintf('tempo impiegato %i secondi\n',ceil(t));