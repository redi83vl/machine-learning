function [Ix,Iy]=deriv_(I);

    dx=[0 0 0;1 0 -1;0 0 0];
    dy=dx';
    Ix=filt(I,dx);
    Iy=filt(I,dy);
    Ix=uint8(Ix);
    Iy=uint8(Iy);
end