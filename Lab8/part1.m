%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
A=imread('Fig-1.JPG');
figure('name','Original');
imshow(A);
resz = imresize(A, 0.25);
figure('name','Smaller');
imshow(resz);
resz_resc = imresize(resz, 4);
figure('name','Rescaled');
imshow(resz_resc);
