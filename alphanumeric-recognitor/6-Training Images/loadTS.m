%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input in, if type of loadin
%-->input sz, size of images for training

%-->output (XD,YD), dataset ready for training
function [TSc,TSn,TSl,TSu]=loadTS(sz)

	TSc=loadCatg(sz);
	
	TSn=loadNums(sz,4);
	
	TSl=loadLows(sz,4);
	
	TSu=loadUpps(sz,4);
	
end

function TS=loadCatg(sz)
	%generates the dataset fom the sored images
	%the images have to be be named with the syntax
	% (0|..|9)(0|..|4).bmp for numbers
	% (a|b|..|z)(0|..|4).bmp for lower cases
	% (A|B|..|Z)(0|..|4).bmp for upper cases
	fprintf('Loading images of numbers...\n');
	TS=loadNums(sz,4);
	XN=TS.XD;
	
	fprintf('Loading images of lowercases...\n');
	TS=loadLows(sz,4);
	XL=TS.XD;
	
	
	fprintf('Loading images of uppercases...\n');
	TS=loadUpps(sz,4);
	XU=TS.XD;
	
	YN=zeros(3,size(XN,2));YN(1,:)=1;
	
	YL=zeros(3,size(XL,2));YL(2,:)=1;
	
	YU=zeros(3,size(XU,2));YU(3,:)=1;
	
	X=[XN XL XU];
	Y=[YN YL YU];
	
	TS=struct('XD',X,'YD',Y);
end

%load numbers
function TS=loadNums(sz,mt)
	n=char(48:57);
	X=[];
	Y=[];
	for i=1:10
		for j=1:mt
			nim=[n(i) char(48+j)];%name 0,..,9
			tim='bmp';%type
			im=imread(['num/' n(i) '/' nim '.' tim]);%complete filename
			imn=imnormalize(im,sz);%normalizing
			x=imn(:);
			X=[X x];
		end
		Y_i=zeros(10,mt);
		Y_i(i,:)=1;
		Y=[Y Y_i];
	end
	TS=struct('XD',X,'YD',Y);
end

%loads lower case characters
function TS=loadLows(sz,mt)
	l=char(97:122);
	X=[];
	Y=[];
	for i=1:26
		for j=1:mt
			nim=[l(i) char(48+j)];%name 0,..,9
			tim='bmp';%type
			im=imread(['low/' l(i) '/' nim '.' tim]);%complete filename
			imn=imnormalize(im,sz);%normalizing
			x=imn(:);
			X=[X x];			
		end
		Y_i=zeros(26,mt);
		Y_i(i,:)=1;
		Y=[Y Y_i];
	end
	TS=struct('XD',X,'YD',Y);
end

%loads upper case characters
function TS=loadUpps(sz,mt)
	u=char(65:90);
	X=[];
	Y=[];
	for i=1:26
		for j=1:mt
			nim=[u(i) char(48+j)];%
			tim='bmp';%type
			im=imread(['upp/' u(i) '/' nim '.' tim]);%complete filename
			imn=imnormalize(im,sz);%normalizing
			x=imn(:);
			X=[X x];
		end
		Y_i=zeros(26,mt);
		Y_i(i,:)=1;
		Y=[Y Y_i];
	end
	TS=struct('XD',X,'YD',Y);
end
