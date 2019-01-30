% La seguente funziona esegue la soppressione dei corner che localmente non
% sono dei massimi. La funzione prende in input la matrice delle misure di
% Harris, sottoposta alla soppressione di qugli elementi che stano al di
% sotto della soglia minima. Posti a zero gli elementi che non superano la
% soglia  si ha una matrice di dimensioni considerovoli che per fortuna ha
% una gran parte degli elemnti nulli, il che consente di usare le funzioni
% di matlab sparse() e find() e quindi risparmiare sia memoria che tempo
% durante la ricerca.

function CMS=nmsup(C)

[m,n]=size(C);

off=3;% diametro finestra = 2*off+1

C=sparse(C);% sparsing della matrice delle misure di Harris
CMS=zeros(m,n);% inizializzazione della matrice dei corner buoni
CMS=sparse(CMS);% sparsing della matrice dei corner

[inz,jnz,cnz]=find(C);% vettore dei non nulli di C, (indice, indice, ampiezza)
num_nz=nnz(C);% numero degli elementi non nulli di C

% inizio procedura di soppressione de non massimi locali
for k=1:num_nz
    % estrazione indici e ampiezza corner
    i=inz(k);
    j=jnz(k);
    c=cnz(k);
 
    if(local_max(C,i,j,1))
        CMS(i,j)=C(i,j);
    end
    
end

CMS=full(CMS);

end