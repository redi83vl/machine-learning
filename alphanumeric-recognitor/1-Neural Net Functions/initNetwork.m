%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%Returns three weights matrix for each layer of the network.

%-->input m, input size of the network
%-->input n, output size of the network
%-->input h, number of network hidden units

%-->output Wh, weights matrix of the hidden layer
%-->output bh, biases vector of the hidden layer
%-->output Wo, weights matrix of the output layer
%-->output bo, biases vector of the ouput layer

function [Wh,bh,Wo,bo]=initNetwork(m,n,h)
    Wh=random('norm',0,.5,m,h);%hidden weights
    bh=zeros(h,1);%hidden biases
    Wo=random('norm',0,.5,h,n);%output weights
    bo=zeros(n,1);%output biases
	fprintf('Random two layered neural network initialized with:\n\t%i inputs\n\t%i outputs \n\t%i hidden units\n',m,n,h);
end