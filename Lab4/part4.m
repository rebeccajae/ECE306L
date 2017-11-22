%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
clear variables
audio = audioread('music.au');
maximum = max(audio(:));
minimum = min(audio(:));
Dista = zeros(1,7);
Distb = zeros(1,7);
PSNRa = zeros(1,7);
PSNRb = zeros(1,7);
r = 1:1:7;
for b = 1:1:7
    N = 2^b;
    Delta = (maximum - minimum)/(N-1);
    codebook_a = minimum-Delta:Delta:maximum;
    codebook_b = minimum-(Delta/2):Delta:maximum+(Delta/2);
    partition = minimum:Delta:maximum;
    [index_a, quantz_a] = quantiz(audio, partition, codebook_a);
    [index_b, quantz_b] = quantiz(audio, partition, codebook_b);
    q_a_e = transpose(quantz_a) - audio;
    q_b_e = transpose(quantz_b) - audio;
    [sz, ~] = size(q_a_e);
    Pa = 1/sz * sum(q_a_e.^2);
    Pb = 1/sz * sum(q_b_e.^2);
    Po = 1/sz * sum(audio.^2);
    PSNRa(b) = Po/Pa;
    PSNRb(b) = Po/Pb;
    Dista(b) = 1/PSNRa(b);
    Distb(b) = 1/PSNRb(b);
end
subplot(2,2,1)
plot(r, PSNRa);
title('PSNR A');
xlabel('Bits');
ylabel('PSNR');
subplot(2,2,2)
plot(r, PSNRb);
title('PSNR B')
xlabel('Bits');
ylabel('PSNR');
subplot(2,2,3)
plot(r, Dista);
title('Distortion A')
xlabel('Bits');
ylabel('Distortion');
subplot(2,2,4)
plot(r, Distb);
title('Distortion B')
xlabel('Bits');
ylabel('Distortion');
