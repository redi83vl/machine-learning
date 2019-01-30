function hcd(I,s,t)

    tic
    fprintf('Avvio calcolo...\n')

    C=corner_detector(I,s,t);% rilevamento corner

    % rendering dei risultati
    IC=I;
    
    if (size(I,3) > 1)
        I = rgb2gray(I);
    end
    
    figure, subplot(2,1,1), spy(C,10);% rendering dei corner
    
    IC(:,:,2)=C;% il secondo livello e occupato dai corner
    IC(:,:,3)=I;% il terzo livello e occupato dall'immagine bw
    
    subplot(2,1,2), imshow(IC); % rendering della combinazione
    toc
end