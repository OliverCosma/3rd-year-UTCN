function PHI = PHI_setup(X_flat, m)
%PHI_SETUP calculates the regressor matrix.
%   We use X_flat, which is the flattened X1 and X2 and the m, the order of
%   the polynomial. The pattern of the regressor is rather similar to
%   Newton Binomial, so that was taken into account as the code was
%   written.

PHI = ones(size(X_flat(:,1)));
count = 2;
for i = 1:m
    for j = 0:i
        PHI(:,count) = (X_flat(:, 1).^(i-j)).*(X_flat(:, 2).^j);
        count = count + 1;
    end
end

end

