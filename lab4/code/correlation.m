% CORRELATION

clc
clear
close all

input_x = [0.3426    3.5784    2.7694   -1.3499    3.0349    0.7254   -0.0631];
fixed_input_x = floatToFixed(input_x);
h_array = [0.7147   -0.2050   -0.1241    1.4897    1.4090];
fixed_h_array = floatToFixed(h_array);

q_format = 2^12;
fixed_corr = correlation_taker(fixed_input_x, fixed_h_array)/(q_format^2);
float_corr = correlation_taker(input_x, h_array);
disp("fixed correlation:");
disp(fixed_corr);
disp("float correlation:");
disp(float_corr);
float_fix_diff = absoluteDifferenceSquare(fixed_corr, float_corr);
disp("absolute error Square:");
disp(float_fix_diff);
float_fix_mse = meanSquareError(fixed_corr, float_corr);
disp("mean square : ");
disp( float_fix_mse);


figure;
stem(float_fix_diff);
title('Absolute Difference Square (Correlation)');
xlabel('Sample');
ylabel('Absolute Difference Square');

function mse = meanSquareError(array1, array2)
mse = 0;
for i = 1:length(array1)
    mse = mse + (array1(i) - array2(i))^2;
end
mse = mse / length(array1);
end

function abs_diff = absoluteDifferenceSquare(array1, array2)
abs_diff = abs((array1 - array2).^2);
end

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

function fixed_array = floatToFixed(input_array)
q_format = 2^12;
fixed_array = fix(input_array * q_format);
end