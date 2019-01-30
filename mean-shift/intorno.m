%input M, set dei campioni
%input x, centro dell'ipersfera
%input hp, raggio della circonferenza sui pixel
%input hc, raggio della sfera nello spazio dei colori
%output Sh, set contenente i campioni interni all'ipersfera
function Sh=intorno(M,x,hp,hc)
    [row col pag]=size(M);
    d=pag+2;%dmensione dello spazio
    Sh=zeros(d,0);
    M=double(M);
    x=double(x);
    %calcolo centri associati a x
    cp=x(1:2);%centro nello spazio dei pixel
    if (pag==1)%gray
        cc=x(3);%centro nel segmento di grigi
    elseif(pag==3)
        cc=x(3:5);%centro nello spazio dei colori
    end
    
    %calcolo degli indici che definiscono i presunti pixel del intorno
    i=cp(1)-hp:cp(1)+hp;%indice i calcolato dalla coordinata x del centro
    i=round(i);%arrotondamento a interi
    i=i(i>0);%soppressioni degli indici non positivi
    i=i(i<row);%soppresione degli indici che superano le righe delle matrice
    j=cp(2)-hp:cp(2)+hp;%indice j calcolato dalla coordinata y del centro
    j=round(j);%arrotondamento a interi
    j=j(j>0);%soppressioni degli indici non positivi
    j=j(j<col);%soppresione degli indici che superano le colonne delle matrice
    
    %estrazione del intorno
    for k=i
        for l=j            
            if (pag==1)%gray
                y=[k l M(k,l)]';%campione grigio da testare
                yc=y(3);
            elseif(pag==3)
                y=[k l M(k,l,1) M(k,l,2) M(k,l,3)]';%campione a colori da testare
                yc=y(3:5);
            end
            dc_xy=norm(cc-yc);
            if(dc_xy<=hc)
                Sh=cat(2,Sh,y);
            end
        end
    end
end
    
    
    
    
    
    
    
    
    
    
    
    
    
    