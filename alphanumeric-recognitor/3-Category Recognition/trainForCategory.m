%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input DS, input examples in cell array, DS{i} is a matrix m-by-h where the
%coloumn vectors are examples of inputs representing the i-th category
%-->input HN, number of unit in the hidden layer
%-->input IT, maximum numeber of iterations for the BackProp algorithm

%-->output (Wh,bh,Wo,bo), neural network parametres
%-->output er, error evolution over the BackProp iterations

function [NET,ER]=trainForCategory(TS,HN,IT)
	XD=TS.XD;
	YD=TS.YD;
	
	[MI,~]=size(XD);%number of inputs
	[NO,~]=size(YD);%number of outputs
	
	[Wh,bh,Wo,bo]=initNetwork(MI,NO,HN);
	
	eta=.05;%learning rate
	alpha=.8;%momentum
	if IT==0
		
	[Wh,bh,Wo,bo,ER]=backPropagationAlgorithm(Wh,bh,Wo,bo,XD,YD,eta,alpha,IT);
	
	NET=struct('In',MI,'Out',NO,'Hid',HN,'WHidden',Wh,'BHidden',bh,'WOut',Wo,'BOut',bo);
	
end