% Read the audio file
[d,r] = audioread('msmn1.wav');

% plot the spectrogram of the original signal
figure(1);
specgram(d,1024,r);
title('Spectrogram of the original signal');

N = 21;
fc = 1000;

% plot the impulse response of the low pass filter
figure(2);
stem(0:N-1,LPF(fc,r,N));
xlabel('n');
ylabel('h(n)');
title('Impulse response of the low pass filter')

% plot the impulse response of the high pass filter
figure(3);
stem(0:N-1,HPF(fc,r,N));
xlabel('n');
ylabel('h(n)');
title('Impulse response of the high pass filter')

% plot the magnitude response of the low pass filter
% figure(4);
fvtool(LPF(fc,r,N));

% plot the magnitude response of the high pass filter
% figure(5);
fvtool(HPF(fc,r,N));

% apply the low pass filter to the signal
LPF_output = conv(d,LPF(fc,r,N));

% plot the spectrogram of the output signal
figure(6);
specgram(LPF_output,1024,r);
title('Spectrogram After applying the low pass filter');

% apply the high pass filter to the signal
HPF_output = conv(d,HPF(fc,r,N));

% plot the spectrogram of the output signal
figure(7);
specgram(HPF_output,1024,r);
title('Spectrogram After applying the high pass filter');
