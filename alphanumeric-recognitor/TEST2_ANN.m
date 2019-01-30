%% LOADING NETWORK PARAMETRES
clc;
clear;
load Net.mat;
sz=sqrt(NET.Cat.In);%image size after normalization
%% TEST 1 - TOTAL RECOGNITION
IM=imread('ann.bmp');
imshow(IM)
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'all');
%% TEST 1 - TOTAL RECOGNITION
IM=imread('ann.bmp');
imshow(IM)
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'upp');