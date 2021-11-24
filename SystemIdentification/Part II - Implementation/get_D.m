function [D] = get_D(y, u, na, nb, nk)
% This is the function to used to make the matrix of delayed inputs and
% outputs.
    N = length(u);
    D = zeros(N, na+nb);
    for k = 1:N
        d = zeros(1, na + nb);
        for i = 1:na 
            if (k - i - nk + 1) > 0
                d(i) = y(k-i-nk+1);
            end
        end
        for i = 1:nb
            if (k - i) > 0
                d(i+na) = u(k-i);
            end
        end
        D(k, :) = d;
    end
end

