fs = 1600;
fc = 400;
N = 39;

[h_n] = LPF(fc, fs, N);

n = (-N + 1)/2 : (N - 1)/2;
stem(n, h_n, 'b', 'Marker', 'o', 'LineWidth', 1.5);
title('LPF Impulse Response with Hamming Window');
xlabel('n');
ylabel('Amplitude');
grid on;
legend('h[n]');

fvtool(h_n, 1, 'Fs', fs);


function [h_n] = LPF(fc,fs,N)
n = (-N + 1)/2 : (N - 1)/2;
omega_c = pi / 2;
hd_n = sin(omega_c * n) ./ (pi * n);
hd_n(N - (N - 1)/2) = omega_c / pi;
w_n = 0.54 - 0.46 * cos(2 * pi * n / (N - 1));
h_n = hd_n .* w_n;
end