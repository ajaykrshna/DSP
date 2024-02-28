% Downsampling

downsamplingFactor2 = 2;
downsamplingFactor3 = 3;

x = [0.5377,1.8339,-2.2588,0.8622,0.3188,-1.3077,-0.4336,0.3426,3.5784,2.7694,-1.3499,3.0349,0.7254,-0.0631,0.7147,-0.2050,-0.1241,1.4897,1.4090,1.4172];

downsampled_2 = downSample(x, downsamplingFactor2);
downsampled_3 = downSample(x, downsamplingFactor3);

disp('Original Signal');
disp(x);
disp('Downsampled by 2 Signal');
disp(downsampled_2);
disp('Downsampled by 3 Signal');
disp(downsampled_3);

% Plot the original and downsampled signals
subplot(3,1,1);
stem(x, 'b', 'DisplayName', 'Original Signal');
title('Original Signal');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Original Signal');

subplot(3,1,2);
stem(downsampled_2, 'r', 'DisplayName', 'Downsampled by 2');
title('Downsampled Signal');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Downsampled by 2 Signal');

subplot(3,1,3);
stem(downsampled_3, 'r', 'DisplayName', 'Downsampled by 3');
title('Downsampled Signal');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Downsampled by 3 Signal');

function y = downSample(x, n)
y = x(1:n:end);
end
