%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
A=imread('Animal-2.JPG');
figure('name','Original');
imshow(A);
%Low Pass
lpf(:,:,1) = 1/9 * [1 1 1;1 1 1;1 1 1];%LPF1
lpf(:,:,2) = 1/16 * [1 2 1;2 4 2;1 2 1];%LPF2
for iter = 1:2
    figure('name', strcat('lpf-', int2str(iter)));
    ifilt = imfilter(A,lpf(:,:,iter));
    imshow(ifilt);
end
%High Pass
hpf(:,:,1) = [-1 -1 -1;-1 8 -1;-1 -1 -1];%HPF1
hpf(:,:,2) = [0 -1 0;-1 4 -1;0 -1 0];%LPF2
for iter = 1:2
    figure('name', strcat('hpf-', int2str(iter)));
    ifilt = imfilter(A,hpf(:,:,iter));
    imshow(ifilt);
end
%Spatial
spatial = [-1 -1 -1;-1 8 -1;-1 -1 -1];
figure('name', strcat('Spatial Filtering'));
ifilt = imfilter(A,spatial,'replicate');
imshow(ifilt);
%Laplacian
laplace = [-1 -1 -1;-1 8 -1;-1 -1 -1];
figure('name', strcat('Spatial Filtering - y1'));
y1 = imfilter(A,laplace,'replicate');
imshow(y1);
figure('name', strcat('Spatial Filtering - y2'));
imshow(A+imshow(y1));
