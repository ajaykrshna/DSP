fs = 5000;
duration = 1;
t = linspace(0, duration, fs*duration);
N = 39;

% Create the input signal
f1 = 500;
f2 = 1000;
f3 = 700;

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);

x = x1 + 2*x2 + 1.5*x3;

% Interpolate the signal
L = 2;
interPolated = interpolate(x, L, fs, N);

% Decimate the signal
M = 2;
decimated = decimate(interPolated, M, fs, N);

% Calculate the mean absolute error
meanError = mean(abs(x - decimated));
disp(meanError);

function interpolated = interpolate(x, L, fs, N)
    upSampled = upSample(x, L);
    LPF_fc = 1250;
    LPF_A = L;
    LPF_V = LPF(LPF_fc,fs,N,LPF_A);
    fullConv = convol(upSampled, LPF_V);
    interpolated = fullConv((length(LPF_V)-1)/2 + 1 : end - (length(LPF_V)-1)/2);
end

function decimated = decimate(x, M, fs, N)
    LPF_fc = 1250;
    LPF_A = 1;
    LPF_V = LPF(LPF_fc,fs,N,LPF_A);
    fullConv = convol(x, LPF_V);
    decimated = fullConv((length(LPF_V)-1)/2 + 1 : end - (length(LPF_V)-1)/2);
    decimated = downSample(decimated, M);
end