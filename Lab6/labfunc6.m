%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
function labfunc6(z,p,k)
%LABFUNC6 it does 306L lab 6 for you
k = 1/k;
[x, Fs] = audioread('music.au');
figure('Name','Plots');
[b,a] = zp2tf(z, p, k);
y = filter(b, a, x);
subplot(1,2,1);
plot(x);
scale = max(abs(x));
axis([0 length(x) -1*scale scale]);
hold on;
plot(y);
xlabel('Samples');
ylabel('Value');
legend('Original','Filtered');

hold off
subplot(1,2,2);
X = fft(x, length(x));
X(1) = 0;
X = X(1:round(length(X)/2));
nfx = Fs * (0:length(x)-1)/length(x);
nfx = nfx(1:round(length(nfx)/2));

Y = fft(y, length(y));
Y(1) = 0;
Y = Y(1:round(length(Y)/2));
nfy = Fs*(0:length(y)-1)/length(y);
nfy = nfy(1:round(length(nfy)/2));
plot(nfx, abs(X));
hold on
plot(nfy, abs(Y));
xlabel('f [Hz]');
ylabel('Magnitude of X(f), Y(f)');
legend('Original','Filtered');
figure('Name','Z-P Diagram');
zplane(b,a);

end
