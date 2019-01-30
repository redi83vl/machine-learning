I=imread('GP01.jpg');

I=rgb2gray(I);

tic
[Ix,Iy]=deriv(I);
toc

tic
[Ix,Iy]=deriv_(I);
toc