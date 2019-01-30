% La seguente funzione effettua l filtraggio gaussiano a una matrice
% immagine ricevuta in input. Grazie alla proprieta di separabilità del
% filtro gaussiano e possibile effetuare due passi separati di filtraggio,
% il primo che effettua un somma delle colonne pesata con i coefficenti
% della gaussiana lineare(1d) poi l'immagine semifiltrata viene ribaltat e
% semifiltrata ulteriormente ottenendo cosi l'immagine filtrata
% definitivamente. Dopo il test effettuato su un immagine 3872x2592 pixel
% si ha un tempo di 102 sec. per l'elaborazione tramite il banale algoritmo
% a doppio for, mentreo con la seguente procedura bastano soli 6 sec. I
% risultati descritti possono essere verificati tramite lo script
% 'test_gauss_filter.m'
function IF=gfilter(I,sigma)

    [IF_H,norm]=uni_gfilter(I,sigma);% filtraggio in na direzione

    IF_HV=uni_gfilter(IF_H',sigma);% filtraggio anche nell'altra direzione

    IF=IF_HV'/norm;% normalizzazione post filtro

end

function [IF_H,norm]=uni_gfilter(I,sigma)

    % generazione delle proiezioni della gaussiana
    off=ceil(2.5*sigma);
    x = -off : +off;

    gx = exp( -x.^2 / ( 2 * sigma^2 ) )/(sqrt(2*pi)*sigma);% proiezzione della gaussiana
    gy = gx';
    [m,n]=size(I);
    % filtraggio omnidirezionale
    I=double(I);
    IF_H=zeros(m,n);
    pad_h=zeros(m,n+2*off+1);
    pad_h(:,1+off:n+off)=I;
    for i=1:n
        IF_H(:,i)=pad_h(:,i:i+2*off)*gy;
            
    end

    norm=sum(sum(gy*gx));% quoziente di normalizzazione della gaussiana

end







