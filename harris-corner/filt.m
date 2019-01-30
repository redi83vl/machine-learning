function FI=filt(I,F)

%dimensioni del filtro
[r,c] = size(F);

%dimensioni dell'immagine
[h,w] = size(I);

%padding dell'immagine
v_off = floor(r/2);
h_off = floor(c/2);

%crea un immagine nera di dimensioni adeguate
PAD = zeros(h+r-1, c+w-1);

%copia al centro l'immagine da filtrare
PAD(v_off+1:(h+v_off),h_off+1:(w+h_off)) = I;

%prealloca la nuova immagine
FI = zeros(h,w);

%per effettuare la convoluzione il filtro viene ribaltato
F = fliplr(F);
F = flipud(F);

%convoluzione
for i=1:h
    for j=1:w
        FI(i,j) = sum(sum(PAD(i:i+r-1, j:j+c-1).*F));
    end
end

