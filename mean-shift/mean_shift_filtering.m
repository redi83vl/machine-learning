% input I, immagine
%
% input hp, dimensione dell'intorno sui pixel
%
% input hc, dimensione della sfera sui colori
%
% output IMF, matrice simile a I, con la diferenza che i valori dei pixel
% di I sono sotituti con i valori del range delle mode dove convergono tali
% pixel

function IMF=mean_shift_filtering(I,hp,hc)

[row col pag]=size(I);%estrazione dimensioni dell'immagine
IMF=zeros(row,col,pag);%inizializzazione dell'immagine filtrata
MAP=zeros(row,col);

tm=0;
for k=1:row*col

    i=ceil(k/col);
    j=k-(i-1)*col;
    
    %cotrollo che il pixel non è stato già assegnato
    if(MAP(i,j)==1)
        continue;
    end
    
    [modx,vicini]=get_moda(I,hp,hc,i,j);%calcolo della moda
    if(pag==1)
         modx_range=modx(3);
         x=[i j I(i,j)]';
    elseif(pag==3)
        modx_range=modx(3:5);
        x=[i j I(i,j,1) I(i,j,2) I(i,j,3)]';
    end
    IMF(i,j,:)=modx_range;
    
    %applicazione del principio di località spaziale

    [d nv]=size(vicini);
    for p=1:nv
        IMF(vicini(1,p),vicini(2,p),:)=modx_range;
        MAP(vicini(1,p),vicini(2,p))=1;
    end
end

