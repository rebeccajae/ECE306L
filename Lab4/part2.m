%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
clear variables
audio = audioread('music.au');
maximum = max(audio(:));
minimum = min(audio(:));
figure
plot(audio);
b = 4; % Some bits per px. Modify this.
N = 2^b;
Delta = (maximum - minimum)/(N-1);
codebook_a = minimum-Delta:Delta:maximum;
codebook_b = minimum-(Delta/2):Delta:maximum+(Delta/2);
partition = minimum:Delta:maximum;
[index_a, quantz_a] = quantiz(audio, partition, codebook_a);
[index_b, quantz_b] = quantiz(audio, partition, codebook_b);
q_a_e = transpose(quantz_a) - audio;
q_b_e = transpose(quantz_b) - audio;
figure('name',strcat(int2str(b), ' bits'))
subplot(2,2,1)
hist(q_a_e, 20);
title('Quantize Error A')
subplot(2,2,2)
hist(q_b_e, 20);
title('Quantize Error B')
[c_a,lags_a] = xcorr(q_a_e,audio,200,'unbiased');
[c_b,lags_b] = xcorr(q_b_e,audio,200,'unbiased');
% figure
% plot(quantz_a);
% figure
% plot(quantz_b);
subplot(2,2,3)
plot(lags_a,c_a);
title('Correlation A')
subplot(2,2,4)
plot(lags_b,c_b);
title('Correlation B')
[sz, ~] = size(audio);
Pa = 1/sz * sum(q_a_e.^2);
Pb = 1/sz * sum(q_b_e.^2);
Po = 1/sz * sum(audio.^2);
PSNRa = Po/Pa;
PSNRb = Po/Pb;
Dista = 1/PSNRa;
Distb = 1/PSNRb;
