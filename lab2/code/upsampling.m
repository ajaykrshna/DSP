% Upsampling using zero insertion

upsamplingFactor2 = 2;
upsamplingFactor3 = 3;

x = [0.5377,1.8339,-2.2588,0.8622,0.3188,-1.3077,-0.4336,0.3426,3.5784,2.7694,-1.3499,3.0349,0.7254,-0.0631,0.7147,-0.2050,-0.1241,1.4897,1.4090,1.4172];

upsampledBy2 = upSample(x, upsamplingFactor2);
upsampledBy3 = upSample(x, upsamplingFactor3);

disp('Original Signal');
disp(x);
disp('Upsampled Signal by 2');
disp(upsampledBy2);
disp('Upsampled Signal by 3');
disp(upsampledBy3);

% Plot the original and upsampled signals
subplot(3,1,1);
stem(x, 'b', 'DisplayName', 'Original Signal');
title('Original Signal');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Original Signal');

subplot(3,1,2);
stem(upsampledBy2, 'r', 'DisplayName', 'Upsampled Signal by 2');
title('Upsampled Signal by 2');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Upsampled Signal by 2');

subplot(3,1,3);
stem(upsampledBy3, 'r', 'DisplayName', 'Upsampled Signal by 3');
title('Upsampled Signal by 3');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Upsampled Signal by 3');

function y = upSample(x, n)
N = length(x);
y = zeros(1, N * n);
y(1:n:end) = x;
end