%% Project Part 1 
%% Loading Identification Data
close all;
clear;
set_name = "iddata-12.mat";
set = load(set_name);
% Enable Surface Plot
surfaceEnable = 0;
% Identification
u_id = set.id.u;
y_id = set.id.y;
% Validation
u_val = set.val.u;
y_val = set.val.y;
%% Choosing The Best Values
na_vec = 1:4;
nb_vec = 1:4;
m_vec = 1:2;

MSE_id = zeros(1, length(nb_vec)*length(na_vec)*length(m_vec));
MSE_pred = zeros(1, length(nb_vec)*length(na_vec)*length(m_vec));
MSE_sim = zeros(1, length(nb_vec)*length(na_vec)*length(m_vec));
combinations = zeros(length(na_vec)*length(m_vec),3);

nk = 1;
N = length(u_id);
count = 1;
for na = na_vec
    for nb = nb_vec
        for m = m_vec
            D = get_D(y_id, u_id, na, nb, 1);
            PHI = get_PHI(D, m);
            theta = PHI\y_id;
            % Prediction ID Y
            y_id_pred = PHI*theta;
            % Prediction Validation Y
            D_pred = get_D(y_val, u_val, na, nb, nk);
            PHI_pred = get_PHI(D_pred, m);
            y_pred = PHI_pred*theta;
            % Simulation 
            y_sim = get_sim(u_val, na, nb, 1, m, theta);
            
            MSE_id(count) = 1/N*sum((y_id - y_id_pred).^2);
            MSE_pred(count) = 1/N*sum((y_val - y_pred).^2);
            MSE_sim(count) = 1/N*sum((y_val - y_sim).^2);
            
            combinations(count, :) = [na nb m];
            % Update count at the end of the loop
            count = count + 1;
        end
    end
end

ind_id = find(MSE_id == min(MSE_id));
id_vals =  combinations(ind_id, :);
ind_pred = find(MSE_pred == min(MSE_pred));
pred_vals =  combinations(ind_pred, :);
ind_sim = find(MSE_sim == min(MSE_sim));
sim_vals =  combinations(ind_sim, :);

%% Get The Best
% Calculating Identification Prediction Output
D_id = get_D(y_id, u_id, id_vals(1), id_vals(2), 1);
PHI_id = get_PHI(D_id, id_vals(3));
theta_id = PHI_id\y_id;
y_id_pred = PHI_id*theta_id;
% Calculating Validation Prediction Output
D_pred_ft = get_D(y_id, u_id, pred_vals(1), pred_vals(2), 1);
PHI_pred_ft = get_PHI(D_pred_ft, pred_vals(3));
theta_pred = PHI_pred_ft\y_id;
D_pred = get_D(y_val, u_val, pred_vals(1), pred_vals(2), 1);
PHI_pred = get_PHI(D_pred, pred_vals(3));
y_pred = PHI_pred*theta_pred;
% Calculating Simulation Output
D_sim = get_D(y_id, u_id, sim_vals(1), sim_vals(2), 1);
PHI_sim = get_PHI(D_sim, sim_vals(3));
theta_sim = PHI_sim\y_id;
y_sim = get_sim(u_val, sim_vals(1), sim_vals(2), 1, sim_vals(3), theta_sim);


%% Test on Identification Data
plot(y_id);
hold on;
plot(y_id_pred);
legend("Identification Data", "Prediction");
title(["Prediction of Identification Values: na= " + num2str(id_vals(1)) + " nb=" + num2str(id_vals(2)) + " m=" + num2str(id_vals(3))]);
xlabel('t');
ylabel('y');
%% Test on Validation Data
figure;
plot(y_val);
hold on;
plot(y_pred);
legend("Validation Data", "Prediction");
title(["Prediction of Validation Values: na= " + num2str(pred_vals(1)) + " nb=" + num2str(pred_vals(2)) + " m=" + num2str(pred_vals(3))]);
xlabel('t');
ylabel('y');

figure;
plot(y_val);
hold on;
plot(y_sim);
legend("Validation Data", "Simulation");
title(["Simulation: na= " + num2str(sim_vals(1)) + " nb=" + num2str(sim_vals(2)) + " m=" + num2str(sim_vals(3))]);
xlabel('t');
ylabel('y');
%% Surface Plots
if (surfaceEnable == 1 && m == 2)
    na = length(na_vec);
    nb = length(nb_vec);
    MSE_id_m1 = MSE_id(1:2:end);
    MSE_id_m2 = MSE_id(2:2:end);
    figure;
    surf(1:na, 1:nb, reshape(MSE_id_m1, [na, nb]));
    view(120,25);
    xlabel("na");
    ylabel("nb");
    title("Identification: m = 1");
    figure;
    surf(1:na, 1:nb, reshape(MSE_id_m1, [na, nb]));
    view(120,25);
    xlabel("na");
    ylabel("nb");
    title("Identification: m = 2");

    MSE_pred_m1 = MSE_pred(1:2:end);
    MSE_pred_m2 = MSE_pred(2:2:end);
    figure;
    surf(1:na, 1:nb, reshape(MSE_pred_m1, [na, nb]));
    view(120,25);
    xlabel("na");
    ylabel("nb");
    title("Prediction: m = 1");
    figure;
    surf(1:na, 1:nb, reshape(MSE_pred_m2, [na, nb]));
    view(350,50);
    xlabel("na");
    ylabel("nb");
    title("Prediction: m = 2");

    MSE_sim_m1 = MSE_sim(1:2:end);
    figure;
    surf(1:na, 1:nb, reshape(MSE_sim_m1, [na, nb]));
    view(133,25);
    xlabel("na");
    ylabel("nb");
    title("Simulation: m = 1");
end














