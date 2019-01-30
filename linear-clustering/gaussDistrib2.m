%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%input (mx,sx), normal distribution parametres over x axis
%input (my,sy), normal distribution parametres over y axis
%input N, number of points to be genrated

function [x,y]=gaussDistrib2(mx,my,sx,sy,n)
    x=random('norm',mx,sx,1,n);%horizontal gaussian component
    y=random('norm',my,sy,1,n);%vertical gaussian component
end