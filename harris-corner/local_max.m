% input-C matrice dei corner
% input-i,j indici dell'elemento da testare
% input-d raggio dell'intorno
% uotput-lm booleano che vale true se C(i,j) e un massimo locale

function lm=local_max(C,i,j,r)

[m,n]=size(C);

% il seguente codice gestisce le situazioni negli estremi di C
i_under=1-(i-r);% uscita finestra in alto
if(i_under>0)top=r-i_under;
else top=r;
end

i_over=i+r-m;% uscita finestra in basso
if(i_over>0)bottom=r-i_over;
else bottom=r;
end

j_under=1-(j-r);% uscita finestra a sinistra
if(j_under>0)left=r-j_under;
else left=r;
end

j_over=j+r-n;% uscita finestra a detra
if(j_over>0)right=r-j_over;
else right=r;
end

% estrazione della finestra
window=C(i-top:i+bottom,j-left:j+right);

% calcolo del valore massimo della finestra
massimo=max(max(window));

lm= (C(i,j)>=massimo);

end