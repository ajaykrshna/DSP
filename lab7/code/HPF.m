function [h_n] = HPF(fc,fs,N)
n = (-N + 1)/2 : (N - 1)/2;
omega_c = 2* pi * fc / fs;
hd_n = (sin(pi*n)- sin(omega_c * n)) ./ (pi * n);
hd_n(N - (N - 1)/2) =1- (omega_c / pi);
w_n = zeros(1, N);
for i = 1:N
    if i >=1 && i <= N
        w_n(i) = 0.54 - 0.46 * cos(2 * pi * (i - 1) / (N - 1));
    end
end
h_n = hd_n .* w_n;
end