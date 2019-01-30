%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

function [character,IM]=characterRecognition(NET,IM,sz,rectip)
	NETC=NET.Cat;
	NETN=NET.Num;
	NETL=NET.Low;
	NETU=NET.Upp;
	
	IM=imnormalize(IM,sz);
	
	% determining category
	% [1 0 0]:Number 
	% [0 1 0]:Lower Case 
	% [0 0 1]:Upper Case
	if strcmp(rectip,'all')
		categ=categoryRecog(NETC,IM,sz);
		if(categ==1)
			fprintf('NM: ');
		elseif(categ==2)
			fprintf('LC: ');
		else
			fprintf('UC: ');
		end
	elseif strcmp(rectip,'num')
		categ=1;
	elseif strcmp(rectip,'low')
		categ=2;
	elseif strcmp(rectip,'upp')
		categ=3;
	end
	
	% switching over the thre cases
	switch(categ)
		case 1 
			%recognition of numbers
			character=numberRecog(NETN,IM);
			fprintf('%c\n',character);
		case 2 
			%recognition of lower case characters
			character=lowerRecog(NETL,IM);
			fprintf('%c\n',character);
		case 3 
			%recognition of upper case characters
			character=upperRecog(NETU,IM);
			fprintf('%c\n',character);
		otherwise
			%error 
			error('Unrecognizable character type.');
	end	
end