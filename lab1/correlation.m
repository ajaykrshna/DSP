% CORRELATION

clc
clear
close all

a = input('Enter the signal: ');
b = input('Enter the seconfd signal: ');

% a = [1 2 3];
% b = [4 5 6];

correlation_val = correlation_taker(a,b);
disp(correlation_val)

function [correlation] = correlation_taker(signal, impulse)
L = length(signal) + length(impulse) - 1;
correlation = zeros(1, L);

for n = 1:L
    for k = 1:length(impulse)
        m = n - k + 1;
        if 1 <= m && m <= length(signal)
            correlation(n) = correlation(n) + signal(m) * impulse(length(impulse) - k + 1);
        end
    end
end
end