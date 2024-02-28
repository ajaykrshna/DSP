fs = 4000;
duration = 1;
t = 0:1/fs:duration;

% Create the input signal
f1 = 500;
f2 = 1000;
f3 = 700;

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);

x = x1 + 2*x2 + 1.5*x3;

% take the fft of the input signal
w = linspace(-pi,pi,length(x));
X = dtft(x, w);

% reduce the amplitude of the output
X = X / max(abs(X));

% create the frequency axis
f = linspace(-fs/2,fs/2,length(X));

plot the input signal
figure(1)
subplot(2,1,1)
plot(t,x)
xlabel('Time (s)')
ylabel('Amplitude')
title('Input Signal')
subplot(2,1,2)
plot(f,abs(X))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Frequency Spectrum of Input Signal')

% define the dtft
function X = dtft(x, w)
    X = zeros(1,length(w));
    for i = 1:length(w)
        for n = 1:length(x)
            X(i) = X(i) + x(n)*exp(-1j*w(i)*(n-1));
        end
    end
end