function [PHI] = get_PHI(D, m)
% This function calls the indices function, to then use it in such fashion
% to adequately create the regressor. The inputs are 'M', the delayed inputs and
% ouputs together with 'm', the polynomial order.
    global indices_;
    indices_ = [];
    size_D = size(D);
    get_indices(1:size_D(2), 1, [], m);
    n = size_D(2);

    comb_size = @(n, m) factorial(n+m-1)/(factorial(m)*factorial(n-1));
    poly_len = zeros(1, m);
    poly_len(1) = n;
    for i = 2:m
       poly_len(i) = comb_size(n, i);
    end

    PHI = zeros(size_D(1), sum(int8(poly_len))+1);
    PHI(:, 1) = ones(size_D(1),1);
    % VALUEABLE indices_(j,end-i+k)
    count = 2;
    for i = 1:length(poly_len)
        for j = 1:poly_len(i)
            val = 1;
            for k = 1:i
                val = val .* D(:,indices_(j,end-i+k));
            end
            PHI(:,count) = val;
            count = count + 1;
        end
    end
end

