%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input NET=(Wh,bh,Wo,bo), neural network parametres
%-->input Im, image of an alphanumeric character

%-->cat, tha category, 1 for numbers, 2 for lower cases and 3 for upper
%cases
function cat=categoryRecog(NET,Im,sz)
	%Extracting weights parametres of the network
	Wh=NET.WHidden;
	bh=NET.BHidden;
	Wo=NET.WOut;
	bo=NET.BOut;
	
	%Normalizing character image
	Im=imnormalize(Im,sz);
	%linearizing the image
	x=Im(:);
	%asking the network
	[~,y]=network2(Wh,bh,Wo,bo,x,'sigmoid');
	y(y<max(y))=0;
	y(y~=0)=1;
	cat=find(y);	
end