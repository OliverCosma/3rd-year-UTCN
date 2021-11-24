function [d] = get_d_sim(u, y, k, na, nb, nk)
% This generated a single case of delayed inptus and outputs and is used in
% the simulation, as you cannot calculated the whole matrix in that case.
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
end

