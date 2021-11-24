function [y] = get_sim(u, na, nb, nk, m, theta)
% This executes the simulations and return the output. It calls the indices
% function, followed by line by line calculations of the D matrix and
% regressor, each time getting a simulated 'y' value as ouput.
    global indices_;
    indices_ = [];
    get_indices(1:(na+nb), 1, [], m);
    n = (na+nb);
    y = zeros(length(u), 1);

    comb_size = @(n, m) factorial(n+m-1)/(factorial(m)*factorial(n-1));
    poly_len = zeros(1, m);
    poly_len(1) = n;
    for i = 2:m
       poly_len(i) = comb_size(n, i);
    end

    for K = 1:length(u)
        d = get_d_sim(u, y, K, na, nb, nk);

        phi = zeros(1, sum(int8(poly_len))+1);
        phi(1) = 1;
        count = 2;
        for i = 1:length(poly_len)
            for j = 1:poly_len(i)
                val = 1;
                for k = 1:i
                    val = val .* d(indices_(j,end-i+k));
                end
                phi(count) = val;
                count = count + 1;
            end
        end

        y(K) = phi*theta;

    end
end



