%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
[x, Fs] = audioread('gore.au');
b0 = 0.095;
numerator = b0 * [1,0, -1];
denominator = [1,0, 0.81];
y = filter(numerator, denominator, x);

subplot(1,2,1);
plot(x);
axis([0 length(x) -0.8 0.8]);
hold on;
plot(y);
xlabel('Samples');
ylabel('Value');
legend('Original', 'Filtered');

hold off
subplot(1,2,2);
X = fft(x, length(x));
X(1) = 0;
X = X(1:round(length(X)/2));
nfx = Fs * (0:length(x)-1)/length(x);
nfx = nfx(1:round(length(nfx)/2));
plot(nfx, abs(X));
hold on
Y = fft(y, length(y));
Y(1) = 0;
Y = Y(1:round(length(Y)/2));
nfy = Fs*(0:length(y)-1)/length(y);
nfy = nfy(1:round(length(nfy)/2));
plot(nfy, abs(Y));
xlabel('f [Hz]');
ylabel('Magnitude of X(f), Y(f)');
legend('Original', 'Filtered');
