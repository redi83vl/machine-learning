%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input w, coloumn vector of unit input weights w=[w0 w1 ... wn]'
%-->input x, coloumn vector of unit input values x=[+1 x1 ... xn]'
%-->input tf, string indicating the threshold function

%-->output ly, linear output of the unit(simple weighted sum)
%-->output y, output value of the unit

function [y,ly]=neuron(w,x,tf)
    ly=w'*x;%weighted summ of inputs
    if(strcmp(tf,'sigmoid'))
        y=1/(1+exp(-ly));
        return;
    end
    if(strcmp(tf,'perceptron'))
        y=sign(ly);
        if(y==0)
            y=-1;
        end
        return
    end
    if(strcmp(tf,'heavside'))
        y=(ly>0);
        return
    end
    y=ly;
end