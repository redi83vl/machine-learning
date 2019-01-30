%% LOADING TRAINING SET
clc;
clear;
% The training set is constructed by the images of charactes stored in th
% directory ..\Alfanumerics Recognition\6-Training Images
sz=20;%size of the resized images prepared for training
[TSc,TSn,TSl,TSu]=loadTS(sz);
%% TRAINING NEURAL NETWORKS
[NET,ER]=characterTraining(TSc,TSn,TSl,TSu);
figure,plot(ER.ERc);
figure,plot(ER.ERn);
figure,plot(ER.ERl);
figure,plot(ER.ERu);