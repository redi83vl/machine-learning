%input M, matrice su cui effettuare i shifting
%input k, dimensione del shifting
%output LSM, matrice shiftata a sinistra

function LSM=right_shift(M,k)

LSM=M;%inizializzazione della matrice shiftata

[m,n,p]=size(LSM);

LSM(:,k+1:n,:)=LSM(:,1:n-k,:);%copia delle n-k colonne sinistre di M

LSM(:,1:k,:)=0;%impostazione a zero delle colonne sporgenti a destra