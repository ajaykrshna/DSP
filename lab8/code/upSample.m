function y = upSample(x, n)
    N = length(x);
    y = zeros(1, N * n);
    y(1:n:end) = x;
    end