%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

function [NET,ER]=trainForUpper(TS,HN,IT)
	XD=TS.XD;
	YD=TS.YD;
	
	[MI,~]=size(XD);%number of inputs
	[NO,~]=size(YD);%number of outputs
	
	[Wh,bh,Wo,bo]=initNetwork(MI,NO,HN);
	
	eta=.05;%learning rate
	alpha=.8;%momentum
	[Wh,bh,Wo,bo,ER]=backPropagationAlgorithm(Wh,bh,Wo,bo,XD,YD,eta,alpha,IT);
	
	NET=struct('In',MI,'Out',NO,'Hid',HN,'WHidden',Wh,'BHidden',bh,'WOut',Wo,'BOut',bo);

end