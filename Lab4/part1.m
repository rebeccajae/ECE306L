%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
clear variables
y = imread('moon.tif'); % Target Image File
z = double(y);
maximum = max(z(:));
minimum = min(z(:));
b = 4; % Some bits per px. Modify this.
N = 2^b;
Delta = (maximum - minimum)/(N-1);
ztemp = z - minimum;
ztemp = round(ztemp/Delta);
ztemp = ztemp.*Delta + minimum;
fig = image(ztemp);
colormap(gray(256));
axis('image');
