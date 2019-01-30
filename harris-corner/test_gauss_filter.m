I=imread('dolce2.jpg');

I=rgb2gray(I);

sigma=3;

fprintf('\napplicazione di imfilter: ');
tic
off=ceil(2.5*sigma);
g=fspecial('gaussian',2*off+1,sigma);
IF=filt(I,g);
toc
figure, imshow(uint8(IF));

fprintf('\napplicazione di gfilter:');
tic
IF=gfilter(I,sigma);
toc
figure, imshow(uint8(IF));