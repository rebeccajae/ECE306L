%%%
% ECE306L Lab Files
% Author: Not totally sure. Excerpted from Lab Manual
%%%
f=imread('Animal-1.jpg');
imshow(f);
[M,N] = size(f);
F = fft2(im2double(f));
sig = 20;
u = 0:(M-1);
v = 0:(N-1);
idx = find(u>M/2);
u(idx)= u(idx)-M;
idy = find(v>N/2);
v(idy)= v(idy)-N;
[U,V] = meshgrid(v,u);
D0 = sig;
D = sqrt(U.^2+V.^2);
H = 1- exp(-D.^2/(2*D0.^2));
G = F.*H;
g = real(ifft2(G));
figure, imshow(g,[ ])
g2=double(g);
g3=g2.^4;
figure,imshow(g3,[ ]);
