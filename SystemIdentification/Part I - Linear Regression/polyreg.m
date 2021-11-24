function [Yv_test, mse_id] = polyreg(X_flat, Y_flat, m, X1v, X2v)
%POLYREG is used for calculating the polynomial regression.
%   We calculate PHI, the polynomial regressors and then solve for
%   theta, the parameters. After doing so, the validation inputs are
%   reshaped in such a format that allows for us to test our model.
%   Afterwards, the result is given as an output (Yv_test) and there is
%   another test done on the identification data, to be able to give the
%   identification MSE as an output as well.
PHI = PHI_setup(X_flat, m);
    
theta = PHI\Y_flat;

Xv_flat = flatten_X(X1v, X2v);
PHIv = PHI_setup(Xv_flat, m);
Yv_test = PHIv * theta;

Y_test = PHI * theta;

mse_id = 1/length(Y_flat) * sum((Y_flat - Y_test).^2);

end

