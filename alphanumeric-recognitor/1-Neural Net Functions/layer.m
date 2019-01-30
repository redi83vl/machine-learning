%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input W, weights matrix W=[ w1 | w2 | ... | wk ] where wi is the weights
%vector of the i-th unit in the layer of k total units w=[wi0 wi1 ... win]'
%-->%input x, coloumn vector of layer input vector x=[+1 x1 ... xn]'
%-->input tf, string indicating the threshold function

%-->output ly, linear vector output of the layer
%-->output y, vector output of the layer

function [y,ly]=layer(W,b,x,tf)

    ly=b+W'*x;%layer linear output vector
    
    if(strcmp(tf,'sigmoid'))
        y=1./(1+exp(-ly));
        return;
    end
    
    if(strcmp(tf,'perceptron'))
        y=sign(ly);
        return
    end
    
    if(strcmp(tf,'heavside'))
        y=(ly>0);
        return
    end
    
    y=ly;
end