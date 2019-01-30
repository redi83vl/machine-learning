clear

I=imread('immagini/1.TIF');

%per motivi prestazionali si effettua il down resize dell'immagine
I=imresize(I,0.7);

%filtraggio gaussiano
g=fspecial('gaussian',5,2);
I=imfilter(I,g);


[m,n,p]=size(I);

hp=8;%(~8) spatial radius
hc=16;%(~16) range radius
sc=16;%(~16) scala clusterizzazione(risoluzione di grigi o colori)
mc=50;%(~50) segmenti con meno mc pixel vengono ignorati
%inizio processo di segmentazione
[msf,msc]=mean_shift_processing(I,hp,hc,sc,mc);



fprintf('\nPreparazione della visualizzazione.\n')

segments=zeros(m,n);
frontiers=zeros(m,n);

[ms ns ps]=size(msc);
if(ps==0)break;end
fprintf('\nIdentificati %i segmenti\n',ps);
for k=1:ps
    frontiers=frontiers+edge(msc(:,:,k),'canny');
end
msf(:,:,2)=msf(:,:,2)+uint8(frontiers)*255;
figure, imshow(uint8(msf));
figure,imshow(frontiers);





































