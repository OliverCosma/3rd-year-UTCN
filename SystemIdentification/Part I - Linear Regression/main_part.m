%% Project Part 1 
%% Loading Identification Data
close all;
clear;
set_name = "proj_fit_12.mat";
set = load(set_name);

X1 = set.id.X{1};
X2 = set.id.X{2};
Y = set.id.Y;
% Transposing the values and then putting them in a format that allows us
% to utilize them for the polynomial regression, having the correct Y
% correspond clearly to each and every possible pair of inputs.
X1 = X1';
X2 = X2';
X_flat = flatten_X(X1, X2);
Y_flat = Y(:);

%% Loading Validation Data
% The same process as with the identification data is applied here.
X1v = set.val.X{1};
X1v = X1v';
X2v = set.val.X{2};
X2v = X2v';
Yv = set.val.Y;
Yv_flat = Yv(:);

%% Setting Up The Test
m = 0;
MSE_old = 1e20;
MSE_new = 1e20;
mse_id = [];

%% Finding the smallest MSE and correct m
% The while loop runs untill we find a bigger MSE value than one previously
% calculated. This will not result in the smallest MSE/best m, but it is a
% good way of approximately knowing when to stop.
while MSE_new <= MSE_old
    % incrementing m
    m = m + 1;
    % calling the polynomial regression function and storing the output
    % tested on validation data and the identification MSE;
    [Yv_test, mse_id(m)] = polyreg(X_flat, Y_flat, m, X1v, X2v);
    % here we calculate the MSE and keep track of the old value as well
    MSE_old = MSE_new;
    MSE_new = 1/length(Yv_test)*sum((Yv_flat - Yv_test).^2);
    % we concatenate the MSE values as to find out the minimum later or and
    % to be able to plot it
    mse(m) = MSE_new;
    
end

new_m = m;

% The FOR LOOP takes 5 extra values after the previous one has ended. There
% is a chance we have found the smallest MSE, but it is highly likely it
% will fluctuate a tad (decrease, increase and then decrease again),
% therefore we ought to make sure by calculating beyond the point in which
% MSE increases a bit.
for i = new_m:(new_m + 14)

    [Yv_test mse_id(i)] = polyreg(X_flat, Y_flat, i, X1v, X2v);
    MSE_old = MSE_new;
    MSE_new = 1/length(Yv_test)*sum((Yv_flat - Yv_test).^2);
    mse(i) = MSE_new;
    
end

% Here we get the minimum value of MSE and the best m.
[mse_min m_best] = min(mse);
Yv_test = polyreg(X_flat, Y_flat, m_best, X1v, X2v);

%% Plotting Validation Data
Yv_plot = unpack_output(Yv_test);
figure;
surf(X1v, X2v, Yv);
figure;
surf(X1v, X2v, Yv_plot);
%% Plotting MSE
figure;
plot(1:length(mse_id), mse_id, 'LineWidth', 1.5); 
hold on;
plot(1:length(mse), mse, 'LineWidth', 1);
hold off;
legend("MSE-ID", "MSE-VALID");
