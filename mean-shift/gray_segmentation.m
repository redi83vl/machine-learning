%gr, risoluzione di grigio
%mp, cluster con meno di mp pixel vengono ignorati
%IMF, immagine da segmentare
%CLI, cluster dell'immagine
function SEGMENT=gray_segmentation(IMF,gr,mp)

[m n p]=size(IMF);

[c , x] = imhist(IMF,16);%istogramma di IMF

SEGMENT=[];%una serie di pagine dove ognuna contiene un cluster

for g=0:gr:255
    %estrazione della pagina con grigi [g+1:g+gr]
    PAG=IMF;
    PAG(PAG<g)=0;
    PAG(PAG>=g+gr)=0;
    PAG=im2bw(PAG,0);%conversione in bw
    %segmentazione delle pagina
    PAG=bwlabel(PAG);%ogni insieme convesso di pixel ha un proprio label
    ncp=max(max(PAG));%label massimo corrisponde al numero dei segmenti nella pagina
    for k=1:ncp
        SEG=PAG;
        SEG(SEG<k)=0;
        SEG(SEG>k)=0;
        if(nnz(SEG)>mp)
            SEGMENT=cat(3,SEGMENT,SEG);%aggiunta del segmento
        end
    end
end


    
    