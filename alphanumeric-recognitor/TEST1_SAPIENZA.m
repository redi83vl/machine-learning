%% LOADING NETWORK PARAMETRES
clc;
clear;
load Net.mat;
sz=sqrt(NET.Cat.In);%image size after normalization
%% TOTAL RECOGNITION
IM=imread('sapbw.bmp');
imshow(IM)
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'all');
%% UPPER CASE RECOGNITION
IM=imread('sapbw.bmp');
imshow(IM)
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'upp');