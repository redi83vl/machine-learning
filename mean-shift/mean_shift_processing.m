%input I, matrice dell'immagine
%input hp, (~8) spatial radius
%input hc, (~16) range radius
%input sc, (~16) scala clisterizzazione(risoluzione di grigi o colori)
%input mc, (~50) segmenti con meno mc pixel vengono ignorati
%output MSF, immagine filtrata con mean shift
%output MSC, collezione dei cluster, gray-->MSC matrice mxnxp con p numero
%dei cluster, rgb-->cell MSC = {MSCRED MSC[2]=MSCGREEN MSC[1]=MSCBLUE{
function [MSF,MSC]=mean_shift_processing(I,hp,hc,sc,mc)

[m n p]=size(I);
if(p==1)
    fprintf('\nImmagine Gray Scale %ix%i\n',m,n);
elseif(p==3)
    fprintf('\nImmagine RGB %ix%i\n',m,n);
end

g=fspecial('gaussian',3,1);
Ig=imfilter(I,g);
Ig=double(Ig);

fprintf('\nMean Shift Filtering:');
tic
MSF=mean_shift_filtering(Ig,hp,hc);
toc

MSF=uint8(MSF);

if(p==3)
    MSFg=rgb2gray(MSF);
end

fprintf('\nMean Shift Segmentation')
tic
MSC=gray_segmentation(MSFg,sc,mc);
toc

fprintf('\nMean Shift Processing terminato.\n')



















