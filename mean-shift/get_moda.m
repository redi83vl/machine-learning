%input M, matrice dei dati
%input h, raggio dell'ipersfera
%input (i,j), campione(pixel di M) per il quale trovare la moda
%output mode, coordinate della moda
%output alber, tutti i punti incontrati stradafacendo
function [moda,alber]=get_moda(M,hp,hc,i,j)

    [row col pag]=size(M);

    x=[];%punto da esaminare
    if(pag==1)%gray
        x=[i j M(i,j)]';
    elseif(pag==3)%rgb
        x=[i j M(i,j,1) M(i,j,2) M(i,j,3)]';
    end
    k=0;
    y=x;
    alber=[];
    while(true)
        k=k+1;
        
        Shy=intorno(M,y,hp,hc);%estrazioni dei camppioni nell'intorno
        alber=cat(2,alber,Shy);
        [d nk]=size(Shy);
        if(nk==0)
            moda=y;
            break;
        end
        x=double(x);y=double(y);
        
        %calcolo del punto dove e diretto il mean shift vector
        [d,nk]=size(Shy);
        if(nk==1)
            y=Shy;
        else
            y=mean(Shy')';
        end
        
        np=norm(y(1:2)-x(1:2));
        if(pag==1)%gray
            nc=abs(y(3)-x(3));
            minc=4;%grigi lontani 8, sono simili
        elseif(pag==3)%rgb
            nc=norm(y(3:5)-x(3:5));
            minc=sqrt(3)*8;%colori lontani 8 nelle tre componenti, sono simili
        end
        minp=5;%punti lontani minp sono vicini
        
        if(nc<=minc && np<=minp)%se mean shift vector ha modulo abbastanza piccolo
            moda=y;%restituzione moda
            break;%uscita dal ciclo di ricerca
        end
        x=y;
    end
end