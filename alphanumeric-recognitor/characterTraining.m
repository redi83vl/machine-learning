%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input TSc, training set structure for category recognition
%-->input TSn, training set structure for numbers recognition
%-->input TSl, training set structure for lower case char recognition
%-->input TSu, training set structure for upper case char recognition

%-->input hnc, hidden units for the category recognition network
%-->input hnn, hidden units for the number recognition network
%-->input hnl, hidden units for the lower case char recognition
%-->input hnu, hidden units for the upper case char recognition
function [NET,ER]=characterTraining(TSc,TSn,TSl,TSu)
	
	%kujtohu te provosh llogaritjen automatike te numrit te njesive te
	%fshehura h..
	
	fprintf('\nTraining the category recognition network.\n');
	%training category recognition network
	h=20;%hidden units
	it=0;%iterations
	tic;[NETc,ERc]=trainForCategory(TSc,h,it);toc
	
	fprintf('\nTraining the numbers recognition network.\n');
	%training numbers recognition network
	h=40;%hidden units
	it=0;%iterations
	tic;[NETn,ERn]=trainForNumbers(TSn,h,it);toc
	
	fprintf('\nTraining the lower cases recognition network.\n');
	%training lower cases recognition network
	h=55;%hidden units
	it=0;%iterations
	tic;[NETl,ERl]=trainForLower(TSl,h,it);toc;
	
	fprintf('\nTraining the upper cases recognition network.\n');
	%training upper cases recognition network
	h=55;%hidden units
	it=0;%iterations
	tic;[NETu,ERu]=trainForUpper(TSu,h,it);toc;
	
	NET=struct('Cat',NETc,'Num',NETn,'Low',NETl,'Upp',NETu);
	ER=struct('ERc',ERc,'ERn',ERn,'ERl',ERl,'ERu',ERu);
	
end









