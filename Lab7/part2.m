%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
clear variables
[x, Fs] = audioread('gore.au');
vals = [
    pi/6 0.95;
    pi/6 0.70;
    pi/3 0.95;
    pi/3 0.70;
    5*pi/6 0.95;
    5*pi/6 0.70
];
iter = 6;%Change Me per run
r = vals(iter, 2);
theta = vals(iter,1);
Z = exp(1j*vals(iter,1));
BZ = (1 - 2*r*cos(theta)*Z^(-1) + r^2 * Z^(-2))/(1-r);
BZ = abs(BZ);
z = tf('z');
H = BZ*(1-r)/(1 - 2*r*cos(theta)*z^(-1) + r^2 * z^(-2));
figure('name', 'Pole-Zero Plot');
pzmap(H);
set(gcf, 'PaperUnits', 'inches')
set(gcf, 'PaperPosition', [0 0 4 4])
print(gcf,'-depsc2','-loose',strcat('2-',int2str(iter), '-b.eps'));
[b,a]=tfdata(H);
[Hd,wd] = freqz(cell2mat(b),cell2mat(a),500);
figure('name','Bode Plot');
subplot(2,1,1);
plot(wd, abs(Hd));
grid;
xlabel('\theta');
ylabel('Magnitude');
subplot(2,1,2);
plot(wd, angle(Hd)*180/pi);
grid;
xlabel('\theta');
ylabel('Angle');
set(gcf, 'PaperUnits', 'inches')
set(gcf, 'PaperPosition', [0 0 4 4])
print(gcf,'-depsc2','-loose',strcat('2-',int2str(iter), '-cd.eps'));
y = filter(cell2mat(b), cell2mat(a), x);
figure('name','Magnitude Plots');
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
set(gcf, 'PaperUnits', 'inches')
set(gcf, 'PaperPosition', [0 0 4 4])
print(gcf,'-depsc2','-loose',strcat('2-',int2str(iter), '-h.eps'));
