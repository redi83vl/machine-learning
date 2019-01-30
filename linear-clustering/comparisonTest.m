%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Dec. 2009

%%
%DATASETS GENRATION
clc;
clear;

%Class 1
m1=[2;3];%means vector of distribution
s1=[1;1];%standard deviations of distribution
N1=450;%number of data
[x1,y1]=gaussDistrib2(m1(1),m1(2),s1(1),s1(2),N1);
C1=[x1;y1;ones(1,N1)];

%Class 2
m2=[4;4];%means vector of distribution
s2=[1;1];%standard deviations of distribution
N2=450;%number of data
[x2,y2]=gaussDistrib2(m2(1),m2(2),s2(1),s2(2),N2);
C2=[x2;y2;-ones(1,N2)];
clear m2 s2 x2 y2;
%%
%CLASSIFICATION - LEAST SQUARES
tic
[a1,b1,c1]=leastSquaresClassification(C1,C2);
[a2,b2,c2]=fisherClassification(C1,C2);
[a3,b3,c3]=perceptronClassification(C1,C2);
toc

%%
%discriminant parametres
fprintf('[a,b,c]=[%.2f,%.2f,%.2f]\n',a1,b1,c1);
fprintf('[a,b,c]=[%.2f,%.2f,%.2f]\n',a2,b2,c2);
fprintf('[a,b,c]=[%.2f,%.2f,%.2f]\n',a3,b3,c3);
%%
%RESULTS OVERVIEW
figure, scatter([C1(1,:) C2(1,:)],[C1(2,:) C2(2,:)],20,[C1(3,:) C2(3,:)],'+');

C=[C1(1:2,:) C2(1:2,:)];
x0=mean(C(1,:),2)-5;
x1=mean(C(1,:),2)+5;

y0=-(a1*x0+c1)/b1;
y1=-(a1*x1+c1)/b1;
line([x0 x1],[y0 y1],'LineWidth',2,'Color',[1 0 0]);

y0=-(a2*x0+c2)/b2;
y1=-(a2*x1+c2)/b2;
line([x0 x1],[y0 y1],'LineWidth',2,'Color',[0 1 0]);

y0=-(a3*x0+c3)/b3;
y1=-(a3*x1+c3)/b3;
line([x0 x1],[y0 y1],'LineWidth',2,'Color',[0 0 1]);