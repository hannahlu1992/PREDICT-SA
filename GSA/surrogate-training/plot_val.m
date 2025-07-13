clear all;
close all;

load("val_CSS.mat");

latx = {'Interpreter', 'latex'};
sz = [14, 12];
labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
nbins = 50;
cmap = copper(3);

fh = figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 2.5]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [10, 2.5]);
set(fh, 'PaperPosition', [0, 0, 10, 2.5]);
tiledlayout(1,2,'Padding', 'compact', 'TileSpacing', 'compact');

nexttile(1)
hold on;
scatter(Perm_test(:,1), 1:1000, 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); % MRST
scatter(Perm_pred(:,1), 1:1000, 20, cmap(3,:), 'd','filled', 'MarkerFaceAlpha', 0.8); % NN surrogate
xlabel(labls(1), latx{:}, 'FontSize', sz(2));
ylabel('sample number', latx{:}, 'FontSize', sz(2));
xlim([min(Perm_pred(:,1))-0.1,max(Perm_pred(:,1))+0.1]);

nexttile(2)
hold on;
scatter(Perm_test(:,2), 1:1000, 20, cmap(1,:), 'o','filled', 'MarkerFaceAlpha', 0.5); % MRST
scatter(Perm_pred(:,2), 1:1000, 20, cmap(3,:), 'd','filled', 'MarkerFaceAlpha', 0.8); % NN surrogate
xlabel(labls(2), latx{:}, 'FontSize', sz(2));
ylabel('sample number', latx{:}, 'FontSize', sz(2));
legend({'MRST','NN surrogate'}, latx{:}, 'FontSize', sz(2), 'Box', 'off', 'Location', 'bestoutside');
print(fh, 'val_CSS-1.pdf', '-dpdf', '-r300'); 

fh = figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 2.5]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [10, 2.5]);
set(fh, 'PaperPosition', [0, 0, 10, 2.5]);
tiledlayout(1,2,'Padding', 'compact', 'TileSpacing', 'compact');

nexttile(1)
edges = linspace(fix(min(Perm_pred(:,1)))-1, fix(max(Perm_pred(:,1))), nbins);
hold on;
histogram(Perm_test(:,1), edges, 'Normalization', 'probability', ...
     'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
histogram(Perm_pred(:,1), edges, 'Normalization', 'probability', ...
     'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs', 'LineStyle', '--');
xlabel(labls(1), latx{:}, 'FontSize', sz(2));
ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% lgd = legend({'MRST','NN surrogate'}, latx{:},'FontSize', sz(2),'Box','off', 'Location', 'best');
% lgd.ItemTokenSize = [5, 1];

nexttile(2)
edges = linspace(fix(min(Perm_pred(:,2)))-1, fix(max(Perm_pred(:,2)))+1, nbins);
hold on;
histogram(Perm_test(:,2), edges, 'Normalization', 'probability', ...
     'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
histogram(Perm_pred(:,2), edges, 'Normalization', 'probability', ...
     'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs', 'LineStyle', '--');
xlabel(labls(2), latx{:}, 'FontSize', sz(2));
ylabel('P [-]', latx{:}, 'FontSize', sz(2));
set(gca, 'YScale', 'log');

h1 = plot(NaN, NaN, '-', 'Color', cmap(1,:), 'LineWidth', 1.5);
h2 = plot(NaN, NaN, '--', 'Color', cmap(3,:), 'LineWidth', 1.5);
lgd = legend([h1, h2], {'MRST', 'NN surrogate'}, latx{:}, ...
    'FontSize', sz(2), 'Box', 'off', 'Location', 'bestoutside');
lgd.ItemTokenSize = [15, 8];  
print(fh, 'val_CSS-2.pdf', '-dpdf', '-r300'); 