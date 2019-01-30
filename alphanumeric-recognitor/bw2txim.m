%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

%-->input IM, bw image assumed to contain image of characters

%-->output IMC, cell array where IMC{i} is a struct with fields
%	Image: is the image of the i-th character
%	Rows: are the row boundries of the char image in the original image
%	Cols: are the row boundries of the char image in the original image
function IMS=bw2txim(NET,IM,sz,rectip)

	IML=bwlabel(IM,8);

	NL=max(max(IML));
	IMS=cell(1,NL);
	for i=1:NL
		IMS_i=IML;
		IMS_i(IMS_i~=i)=0;
		IMS_i=IMS_i/i;
		
		[x y]=find(IMS_i);
		rmin=min(x);
		rmax=max(x);
		cmin=min(y);
		cmax=max(y);
		
		IMS_i=IMS_i(rmin:rmax,cmin:cmax);

		[charac,cim]=characterRecognition(NET,IMS_i,sz,rectip);

		CIM_i=struct('Char',charac,'Image',IMS_i,'Rows',[rmin rmax],'Cols',[cmin cmax]);
		
		IMS{i}=CIM_i;
	end
end









