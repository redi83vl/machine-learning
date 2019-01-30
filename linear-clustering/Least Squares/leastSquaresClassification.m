%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%Reference - Christopher M. Bishop, Pattern Recognition and Machine Learning

%input (C1,C2), datasets of two classes. 2-by-N1 and 2-by-N2 matrices
%containing the 2D-data as coloumn vectors.
%output (a,b,c), linear discriminant parametres whos equation is ax1+bx2+c=0

function [a,b,c]=leastSquaresClassification(C1,C2)
    [~,N1]=size(C1);%number of class-one data
    [~,N2]=size(C2);%number of class-two data
    
    N=N1+N2;%total number of data

    C=[C1(1:2,:) C2(1:2,:)];%dataset with data from both classes
    X=[ ones(N,1) , C' ];%matrix of inputs in homogeneus coordinates
    
    T=[C1(3,:),C2(3,:)]';%vector of target values
    
    W=pinv(X)*T;%vector of weights
    
    a=W(2);b=W(3);c=W(1);%returning parametres
end