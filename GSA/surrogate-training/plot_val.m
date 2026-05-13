clear all;
close all;

% load("val_CSS.mat");
% msq2mD = 9.869e-16;
% Perm_test = Perm_test-log10(msq2mD);
% Perm_pred = Perm_pred-log10(msq2mD);
% 

% latx = {'Interpreter', 'latex'};
% sz = [14, 12];
% labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
% nbins = 50;
% cmap = copper(3);
% 
% fh = figure(randi(10000, 1, 1));
% set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 2.5]); % [x, y, width, height]
% set(fh, 'PaperUnits', 'inches');
% set(fh, 'PaperSize', [10, 2.5]);
% set(fh, 'PaperPosition', [0, 0, 10, 2.5]);
% tiledlayout(1,2,'Padding', 'compact', 'TileSpacing', 'compact');
% 
% nexttile(1)
% hold on;
% scatter(Perm_test(:,1), 1:1000, 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); % MRST
% scatter(Perm_pred(:,1), 1:1000, 20, cmap(3,:), 'd','filled', 'MarkerFaceAlpha', 0.8); % NN surrogate
% xlabel(labls(1), latx{:}, 'FontSize', sz(2));
% ylabel('sample number', latx{:}, 'FontSize', sz(2));
% xlim([0,1.5]);
% 
% nexttile(2)
% hold on;
% scatter(Perm_test(:,2), 1:1000, 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); % MRST
% scatter(Perm_pred(:,2), 1:1000, 20, cmap(3,:), 'd','filled', 'MarkerFaceAlpha', 0.8); % NN surrogate
% xlabel(labls(2), latx{:}, 'FontSize', sz(2));
% ylabel('sample number', latx{:}, 'FontSize', sz(2));
% xlim([-6,2]);
% legend({'MRST','NN surrogate'}, latx{:}, 'FontSize', sz(2), 'Box', 'off', 'Location', 'bestoutside');
% % print(fh, 'val_CSS-1.pdf', '-dpdf', '-r300'); 
% 
% fh = figure(randi(10000, 1, 1));
% set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 2.5]); % [x, y, width, height]
% set(fh, 'PaperUnits', 'inches');
% set(fh, 'PaperSize', [10, 2.5]);
% set(fh, 'PaperPosition', [0, 0, 10, 2.5]);
% tiledlayout(1,2,'Padding', 'compact', 'TileSpacing', 'compact');
% 
% nexttile(1)
% edges = linspace(fix(min(Perm_pred(:,1)))-0.5, fix(max(Perm_pred(:,1)))+0.5, nbins);
% hold on;
% histogram(Perm_test(:,1), edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(Perm_pred(:,1), edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs', 'LineStyle', '--');
% xlabel(labls(1), latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% xlim([0,1.5]);
% % lgd = legend({'MRST','NN surrogate'}, latx{:},'FontSize', sz(2),'Box','off', 'Location', 'best');
% % lgd.ItemTokenSize = [5, 1];
% 
% nexttile(2)
% edges = linspace(fix(min(Perm_pred(:,2)))-1, fix(max(Perm_pred(:,2)))+1, nbins);
% hold on;
% histogram(Perm_test(:,2), edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(Perm_pred(:,2), edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs', 'LineStyle', '--');
% xlabel(labls(2), latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% xlim([-6,2]);
% set(gca, 'YScale', 'log');
% 
% h1 = plot(NaN, NaN, '-', 'Color', cmap(1,:), 'LineWidth', 1.5);
% h2 = plot(NaN, NaN, '--', 'Color', cmap(3,:), 'LineWidth', 1.5);
% lgd = legend([h1, h2], {'MRST', 'NN surrogate'}, latx{:}, ...
%     'FontSize', sz(2), 'Box', 'off', 'Location', 'bestoutside');
% lgd.ItemTokenSize = [15, 8];  
% % print(fh, 'val_CSS-2.pdf', '-dpdf', '-r300'); 
% 
% fh = figure(randi(10000, 1, 1));
% set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 2.5]); % [x, y, width, height]
% set(fh, 'PaperUnits', 'inches');
% set(fh, 'PaperSize', [10, 2.5]);
% set(fh, 'PaperPosition', [0, 0, 10, 2.5]);
% tiledlayout(1,2,'Padding', 'compact', 'TileSpacing', 'compact');
% 
% nexttile(1)
% hold on;
% scatter(Perm_test(:,1), abs(Perm_pred(:,1)-Perm_test(:,1))./abs(Perm_test(:,1)), 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); 
% xlabel(labls(1), latx{:}, 'FontSize', sz(2));
% ylabel('error', latx{:}, 'FontSize', sz(2));
% xlim([0,1.5]);
% 
% nexttile(2)
% hold on;
% scatter(Perm_test(:,2), abs(Perm_pred(:,2)-Perm_test(:,2))./abs(Perm_test(:,2)), 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); % MRST
% xlabel(labls(2), latx{:}, 'FontSize', sz(2));
% ylabel('error', latx{:}, 'FontSize', sz(2));
% xlim([-6,2]);
% % legend({'MRST','NN surrogate'}, latx{:}, 'FontSize', sz(2), 'Box', 'off', 'Location', 'bestoutside');
% % print(fh, 'val_CSS-1.pdf', '-dpdf', '-r300'); 
% 
% Q10_test_x = prctile(Perm_test(:,1),10)
% Q10_pred_x = prctile(Perm_pred(:,1),10)
% Q50_test_x = prctile(Perm_test(:,1),50)
% Q50_pred_x = prctile(Perm_pred(:,1),50)
% Q90_test_x = prctile(Perm_test(:,1),90)
% Q90_pred_x = prctile(Perm_pred(:,1),90)
% abs(Q10_test_x-Q10_pred_x)/abs(Q10_test_x)
% 
% 
% Q10_test_z = prctile(Perm_test(:,2),10)
% Q10_pred_z = prctile(Perm_pred(:,2),10)
% Q50_test_z = prctile(Perm_test(:,2),50)
% Q50_pred_z = prctile(Perm_pred(:,2),50)
% Q90_test_z = prctile(Perm_test(:,2),90)
% Q90_pred_z = prctile(Perm_pred(:,2),90)

msq2mD = 9.869e-16;
% load("val_CSC.mat");
% Perm_test = Perm_test-log10(msq2mD);
% Perm_pred = Perm_pred-log10(msq2mD);

% load("val_CSS.mat");
% Perm_test = Perm_test-log10(msq2mD);
% Perm_pred = Perm_pred-log10(msq2mD);

% load("val_SCC.mat");
% Perm_test = Perm_test-log10(msq2mD);
% Perm_pred = Perm_pred-log10(msq2mD);

load("val_SCS.mat");
Perm_test = Perm_test-log10(msq2mD);
Perm_pred = Perm_pred-log10(msq2mD);

% IQR = prctile(Perm_pred_CSC(:,1),75)-prctile(Perm_pred_CSC(:,1),25)



latx = {'Interpreter', 'latex'};
sz = [14, 12];
labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
nbins = 50;
cmap = copper(3);

fh = figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 3, 6]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [3,6]);
set(fh, 'PaperPosition', [0, 0, 3, 6]);
tiledlayout(2,1,'Padding', 'compact', 'TileSpacing', 'compact');

nexttile(1)
% ---- Compute R^2 ----
SS_res = sum((Perm_test(:,1) - Perm_pred(:,1)).^2);
SS_tot = sum((Perm_test(:,1) - mean(Perm_test(:,1))).^2);
R2 = 1 - SS_res / SS_tot;
hold on;
scatter(Perm_test(:,1), Perm_pred(:,1), 20, cmap(2,:), 'o','filled', 'MarkerFaceAlpha', 0.5); 
% 1:1 line
min_val = min([Perm_test(:,1); Perm_pred(:,1)]);
max_val = max([Perm_test(:,1); Perm_pred(:,1)]);
plot([min_val max_val], [min_val max_val], 'k--', 'LineWidth', 1.5);
xlabel('MRST (reference)', latx{:}, 'FontSize', sz(2));
ylabel('NN prediction', latx{:}, 'FontSize', sz(2));
% Equal axis for fair comparison
axis equal;
xlim([min_val max_val]);
ylim([min_val max_val]);
% ---- Print R^2 on plot ----
text(0.05, 0.9, sprintf('$\\log_{10}(k_{xx}),\\; R^{2} = %.3f$', R2), ...
    'Units', 'normalized', ...
    'Interpreter', 'latex', ...
    'FontSize', 12);


nexttile(2)
% ---- Compute R^2 ----
SS_res = sum((Perm_test(:,2) - Perm_pred(:,2)).^2);
SS_tot = sum((Perm_test(:,2) - mean(Perm_test(:,2))).^2);
R2 = 1 - SS_res / SS_tot;
hold on;
scatter(Perm_test(:,2), Perm_pred(:,2), 20, cmap(2,:), 'o','filled', 'MarkerFaceAlpha', 0.5); 
% 1:1 line
min_val = min([Perm_test(:,2); Perm_pred(:,2)]);
max_val = max([Perm_test(:,2); Perm_pred(:,2)]);
plot([min_val max_val], [min_val max_val], 'k--', 'LineWidth', 1.5);
xlabel('MRST (reference)', latx{:}, 'FontSize', sz(2));
ylabel('NN prediction', latx{:}, 'FontSize', sz(2));
% Equal axis for fair comparison
axis equal;
xlim([min_val max_val]);
ylim([min_val max_val]);
% ---- Print R^2 on plot ----
text(0.05, 0.9, sprintf('$\\log_{10}(k_{zz}),\\; R^{2} = %.3f$', R2), ...
    'Units', 'normalized', ...
    'Interpreter', 'latex', ...
    'FontSize', 12);
print(fh, 'val_SCS-R2.pdf', '-dpdf', '-r300'); 
