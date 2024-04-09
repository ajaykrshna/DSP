fs = 6000;
fc1 = 500;
fc2 = 1200;
N = 39;

h_n = BPF(fc1, fc2, fs, N);


n = (-N + 1)/2 : (N - 1)/2;
stem(n, h_n, 'b', 'Marker', 'o', 'LineWidth', 1.5);
title('BPF Impulse Response with Hamming Window');
xlabel('n');
ylabel('Amplitude');
grid on;
legend('h[n]');

fvtool(h_n);

function [h_n] = BPF(fc1, fc2, fs, N)
n = (-N + 1)/2 : (N - 1)/2;
omega_c1 = 2 * pi * fc1 / fs;
omega_c2 = 2 * pi * fc2 / fs;
hd_n = (sin(omega_c2 * n) - sin(omega_c1 * n)) ./ (pi * n);
hd_n(N - (N - 1)/2) = (omega_c2 - omega_c1) / pi;
w_n = zeros(1, N);
for i=1:N
    if i >= 1 && i <= N
        w_n(i) = 0.54 - 0.46 * cos(2 * pi * (i - 1) / (N - 1));
    end
end
h_n = hd_n .* w_n;
end