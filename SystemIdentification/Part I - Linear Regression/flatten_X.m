function X_flat = flatten_X(X1, X2)
%FLATTEN_X reshapes X1 and X2 in a 2 column vector.
%   We reshape X in such a fashion that we account for every possible pair
%   of inputs in a 2 column vector. This means we go every pair of X1 and
%   X2 values so that the Y column vector corresponds to it accordingly.
X_flat = [X1(1)*ones(size(X1(:,1))), X2(:, 1)];

for i = 2:length(X1)
   
    X_flat = [X_flat;[X1(i)*ones(size(X1(:,1))), X2(:, 1)]];
    
end


end

