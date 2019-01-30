function DMS=disparities(UL,UR,md)

[m,n,p]=size(UL);

DMS=zeros(m,n,0);

for k=1:md
    %shift a destra di UR di ka colonne
    SUR=right_shift(UR,k);
    %calcolo della differenza
    DMSk=difftensor(UL,SUR);
    %memorizzazione risultato della k-esima disparità
    DMS=cat(3,DMS,DMSk);

end