%% LOADING NETWORK PARAMETRES
clc;
clear;
load Net.mat;
sz=sqrt(NET.Cat.In);%image size after normalization
%% TEST 1 - TOTAL RECOGNITION
IM=imread('ml.bmp');
imshow(IM)
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'all');
%% TEST 1 - LOWER CASES RECOGNITION
IM=imread('ml.bmp');
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'low');
%% TEST 1 - UPPER CASES RECOGNITION
IM=imread('ml.bmp');
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'upp');
%% TEST 1 - DECIMAL RECOGNITION
IM=imread('ml.bmp');
% EXTRACTION AND RECOGNITION
CIM=bw2txim(NET,IM,sz,'num');

