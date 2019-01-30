%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

function low=lowerRecog(NET,IM)

	
	Wh=NET.WHidden;
	bh=NET.BHidden;
	Wo=NET.WOut;
	bo=NET.BOut;
	
	%image conversion to linear vector
	x=IM(:);
	%getting the network response
	[~,y]=network2(Wh,bh,Wo,bo,x,'sigmoid');
	
	%(rounding)suppressing non maxima in y
	y(y<max(y))=0;
	y(y>0)=1;
	
	low=getLow(y);	

end

function num=getLow(y)
	nums=char(97:122);
	index=find(y==1);
	num=nums(index);	 %#ok<FNDSB>
end
