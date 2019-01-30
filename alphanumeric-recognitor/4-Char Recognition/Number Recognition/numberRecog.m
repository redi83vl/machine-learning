%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input (Wh,bh,Wo,bo), network parametres
%-->input im, image of the number to be recognized

%output num, char primitive of the recognized

function num=numberRecog(NET,IM)
	
	Wh=NET.WHidden;
	bh=NET.BHidden;
	Wo=NET.WOut;
	bo=NET.BOut;
	
	%IMage conversion to linear vector
	x=IM(:);
	
	%getting the network response
	[~,y]=network2(Wh,bh,Wo,bo,x,'sigmoid');
	
	%(rounding)suppressing non maxima in y
	y(y<max(y))=0;
	y(y>0)=1;
	
	num=getNum(y);	
end


function num=getNum(y)
	nums='0123456789';
	index=find(y==1);
	num=nums(index);	 %#ok<FNDSB>
end











