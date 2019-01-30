% La seguente funzione effettua il calcolo delle derivate parziali della
% matrice immagine. Il punto debole consiste nel fato che fa uso dei due
% piu semplici operatori dx=[0 0 0;1 0 -1;0 0 0] e dy=[0 1 0;0 0 0;0 -1 0].
% Comunque il punto di forza sta nel fatto che la convoluzione di I con gli
% operatori e simile alla diferenza riga per riga(colonna per colonna) nel
% immagine.
% Da un test effettuato in un immagine 2000x2000 l'operazione di
% derivazione tramite convoluzio ha richiesto circa 55 secondi mentre con
% la procedura sottostante sono bastati 1.6 secondi. La prova puo essere 
% effettuata tramite lo scipt che risiede ne file 'test_derivata.m'

function [Ix,Iy]=deriv(I);

    [m,n]=size(I);
    Ix=zeros(m,n);
    Iy=zeros(m,n);
    
    Ix(1,:)=I(2,:);
    Ix(m,:)=-I(m-1,:);
    % calcolo dI/dy
    for i=2:m-1
        Iy(i,:)=I(i+1,:)-I(i-1,:);
    end

    % calcolo dI/dx
    Iy(:,1)=I(:,2);
    Iy(:,n)=I(:,n-1);
    for i=2:n-1
        Ix(:,i)=I(:,i+1)-I(:,i-1);
    end
    Ix=uint8(Ix);
    Iy=uint8(Iy);
end