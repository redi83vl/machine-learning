%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%Ouput cmputation of a two layered feed-forward neural network


%-->input x, input vector to propagate in the network

%-->output y1, output vector of the hidden layer
%-->output y2, output vector of the output layer layer

function [yh,yo]=network2(Wh,bh,Wo,bo,x,tf)

    %******HIDDEN LAYER SIMULATION******
    xh=x;
    [rx,cx]=size(xh);%size of input vector in the hidden layer
    [rw,cw]=size(Wh);%sixe of hidden weights matrix
    if(rw~=rx)
        error('Hidden Layer: weights matrix size not correct.');
    end
    [yh,~]=layer(Wh,bh,x,tf);%returning the hidden layer output
    

    %******OUTPUT LAYER SIMULATION******
    xo=yh;
    [rx,cx]=size(xo);%size of input vector in the output layer
    [rw,cw]=size(Wo);%sixe of output weights matrix
    if(rw~=rx)
        error('Output Layer: weights matrix size not correct.');
    end
    [yo,~]=layer(Wo,bo,xo,tf);
    
end

    
    
    
    
    
    
    
    
    
    
    