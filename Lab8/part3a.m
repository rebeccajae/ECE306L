%%%
% ECE306L Lab Files
% Author: Not totally sure. Excerpted from Lab Manual
%%%
f=imread('Fig-1.jpg');
figure, imshow(f);
F=fft2(im2double(f));
S=abs(F);
figure, imshow(S,[]);
Fc=fftshift(F);
S=abs(Fc);
figure, imshow(S,[]);
S2=log(1+abs(Fc));
figure, imshow(S2,[]);
% Average Value
[M,N]=size(f);
S=double(f);
sum=0;
for m=1:M
    for n=1:N
        sum=S(m,n)+sum;
    end
end
A=sum/(M*N);
