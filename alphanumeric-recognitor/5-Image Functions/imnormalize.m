%Author: REDJAN F. SHABANI
%Universita' degli studi di Roma "LA SAPIENZA"
%Ingegneria Informatica - Intelligenza Artificiale
%Version: Gen. 2010

function out=imnormalize(im,sz)
	[im_r,im_c]=find(im);%index of non  zero enitries in the image
	diff_r=max(im_r)-min(im_r);%diametro verticale del quadrato che include l'immagine
	diff_c=max(im_c)-min(im_c);%   - / / -   horizontale      - / / -	
	
	out=im(min(im_r):max(im_r),min(im_c):max(im_c));%taglio della regione di interesse
	drc=round((diff_r-diff_c)/2);
	if(drc>0)
		out = [ zeros(diff_r+1,drc) , out , zeros(diff_r+1,drc) ];
	else
		out = [ zeros(abs(drc),diff_c+1) ; out ;  zeros(abs(drc),diff_c+1) ];
	end
	out=logical(out);
	out=imresize(out,[sz sz]);
	%out=bwmorph(out,'skel',Inf);
end