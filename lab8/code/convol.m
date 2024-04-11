function [conv] = convol(signal, impulse)
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