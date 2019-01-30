%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%Class definition for Perceptron objects

classdef perceptron
    properties
        bias;%unit bias
        weights;%input weights
    end
    methods
        %method costructor for a perceptron object
        function obj=perceptron(in)
            obj.bias=0;
            obj.weights=ones(in,1);
        end
        %method for getting the output of a perceptron unit, geiven the
        %inputs
        function y=output(perc,x)
            [sx,nx]=size(x);
            [sw,~]=size(perc.weights);
            if(sx~=sw)
                error('Bad input vector dimension!');
            end
            y=sign(perc.bias*ones(1,nx)+perc.weights'*x);
            y(y==0)=-1;
        end
    end
end