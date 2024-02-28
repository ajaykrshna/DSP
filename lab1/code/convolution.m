% CONVOLUTION

clc
clear
close all

a = input('Enter the signal: ');
b = input('Enter the impulse response: ');

% a = [1 2 3];
% b = [4 5 6];
conv_val = conv_taker(a,b);
disp(conv_val)

function [conv] = conv_taker(signal, impulse)
L = length(signal) + length(impulse) - 1;
conv = zeros(1, L);

for n = 1:L
    for k = 1:length(impulse)
        m = n - k + 1;
        if 1 <= m && m <= length(signal)
            conv(n) = conv(n) + signal(m) * impulse(k);
        end
    end
end
end
