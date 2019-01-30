% La funzione effettua il rilevamento dei corner di un immagine con la
% procedura descrita da Harris. Il codice è strutturato seguendo i diversi
% passi descritti nel testo del homework.
% input- 'I' matrice del immagine 
% input- 's'parametro gaussiana
% input- 't' frazione soglia minima dei corner

function C=corner_detector(I,s,t)

% conversione in scala di grigi
if (size(I,3) > 1)
    I = rgb2gray(I);
end

% calcolo derivate
fprintf('\nCalcolo derivate: \n');
[Ix,Iy]=deriv(I);
toc

% calcolo potenze e prodotto
Ix2=Ix.^2;
IxIy=Ix.*Iy;
Iy2=Iy.^2;

% applicazione del filtro gaussiano
fprintf('\nFiltraggio gaussiano: ')
fIx2=gfilter(Ix2,s);
fIxIy=gfilter(IxIy,s);
fIy2=gfilter(Iy2,s);
toc

%calcolo della matrice delle misure di Harris
a=fIx2.*fIy2 - fIxIy.^2;
b=0.04*(fIx2+fIy2).^2;
C = a-b ;

% soppressione dei non-max globali
min=t*max(max(C));
fprintf('\nSoppressione dei non massimi globali < %d: ',min)
C(C<min)=0;
toc

% soppressione dei non-max locali e globali
fprintf('\nSoppressione dei non massimi locali: ')
C=nmsup(C);
toc

end