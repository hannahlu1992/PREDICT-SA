clear all;
close all;

%% OAT for a |sand\   clay|
%%           |clay \      |
CASE = 'CSC';
% plot_distribution_shift(CASE);
plot_tornado(CASE,50);
plot_tornado(CASE,10);
plot_tornado(CASE,90);

%% OAT for a |sand\   sand|
%%           |clay \      |
% CASE = 'CSS';
% plot_distribution_shift(CASE);
% plot_tornado(CASE,50);
% plot_tornado(CASE,10);
% plot_tornado(CASE,90);

% %% OAT for a |caly\   sand|
% %%           |sand \      |
% CASE = 'SCS';
% % plot_distribution_shift(CASE);
% plot_tornado(CASE,50);
% plot_tornado(CASE,10);
% plot_tornado(CASE,90);

% %% OAT for a |caly\   clay|
% %%           |sand \      |
% CASE = 'SCC';
% % plot_distribution_shift(CASE);
% plot_tornado(CASE,50);
% plot_tornado(CASE,10);
% plot_tornado(CASE,90);


% load(['CSS_baseline.mat'],'kxx','kzz');
% kxx_base = log10(kxx);
% kzz_base = log10(kzz);
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
% tiledlayout(1,3,'Padding', 'compact', 'TileSpacing', 'compact');
% 
% nexttile(1)
% load(['CSS_p6+.mat'],'kxx');
% kxx_p1_plus = log10(kxx);
% load(['CSS_p6-.mat'],'kxx');
% kxx_p1_minus = log10(kxx);
% logMinP = min([kxx_base; kxx_p1_plus; kxx_p1_minus]);
% logMaxP = max([kxx_base; kxx_p1_plus; kxx_p1_minus]);
% edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
% hold on;
% histogram(kxx_p1_minus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kxx_base, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(2,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kxx_p1_plus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% xlabel(labls(1), latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% xlim([fix(logMinP)-1, fix(logMaxP)+7]);
% lgd = legend(...
%     '$z_{max} = 1$k [m]', ...
%     '$z_{max} = 2$k [m]', ...
%     '$z_{max} = 3$k [m]', ...
%     latx{:},...
%     'FontSize', sz(2), ...
%     'Box', 'off');
% lgd.ItemTokenSize = [5, 1]; 
% 
% nexttile(2)
% load(['CSS_p4+.mat'],'kxx');
% kxx_p1_plus = log10(kxx);
% load(['CSS_p4-.mat'],'kxx');
% kxx_p1_minus = log10(kxx);
% logMinP = min([kxx_base; kxx_p1_plus; kxx_p1_minus]);
% logMaxP = max([kxx_base; kxx_p1_plus; kxx_p1_minus]);
% edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
% hold on;
% histogram(kxx_p1_minus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kxx_base, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(2,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kxx_p1_plus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% xlabel(labls(1), latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% xlim([fix(logMinP)-1, fix(logMaxP)+2]);
% lgd = legend(...
%     '$f_\beta = 50$ [deg]', ...
%     '$f_\beta = 65$ [deg]', ...
%     '$f_\beta = 80$ [deg]', ...
%     latx{:}, 'FontSize', sz(2),'box','off');
% lgd.ItemTokenSize = [5, 1]; 
% 
% nexttile(3)
% load(['CSS_p3+.mat'],'kzz');
% kzz_p1_plus = log10(kzz);
% load(['CSS_p3-.mat'],'kzz');
% kzz_p1_minus = log10(kzz);
% logMinP = min([kzz_base; kzz_p1_plus; kzz_p1_minus]);
% logMaxP = max([kzz_base; kzz_p1_plus; kzz_p1_minus]);
% edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
% hold on;
% histogram(kzz_p1_minus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(3,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kzz_base, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(2,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% histogram(kzz_p1_plus, edges, 'Normalization', 'probability', ...
%     'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% xlabel(labls(2), latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% xlim([fix(logMinP)-1, fix(logMaxP)+2]);
% lgd = legend(...
%     '$V_{cl}^{HW} = 0.1$', ...
%     '$V_{cl}^{HW} = 0.2$', ...
%     '$V_{cl}^{HW} = 0.3$', ...
%     latx{:}, 'FontSize', sz(2),'box','off');  
% set(gca, 'YScale', 'log');
% lgd.ItemTokenSize = [5, 1]; 
% print(fh, 'OAT.pdf', '-dpdf', '-r300');  % -r300 sets resolution to 300 DPI

function plot_distribution_shift(CASE)
load([CASE '_baseline.mat'],'kxx','kzz');
kxx_base = log10(kxx);
kzz_base = log10(kzz);
load([CASE '_p1+.mat'],'kxx','kzz');
kxx_p1_plus = log10(kxx);
kzz_p1_plus = log10(kzz);
load([CASE '_p1-.mat'],'kxx','kzz');
kxx_p1_minus = log10(kxx);
kzz_p1_minus = log10(kzz);
load([CASE '_p2+.mat'],'kxx','kzz');
kxx_p2_plus = log10(kxx);
kzz_p2_plus = log10(kzz);
load([CASE '_p2-.mat'],'kxx','kzz');
kxx_p2_minus = log10(kxx);
kzz_p2_minus = log10(kzz);
load([CASE '_p3+.mat'],'kxx','kzz');
kxx_p3_plus = log10(kxx);
kzz_p3_plus = log10(kzz);
load([CASE '_p3-.mat'],'kxx','kzz');
kxx_p3_minus = log10(kxx);
kzz_p3_minus = log10(kzz);
load([CASE '_p4+.mat'],'kxx','kzz');
kxx_p4_plus = log10(kxx);
kzz_p4_plus = log10(kzz);
load([CASE '_p4-.mat'],'kxx','kzz');
kxx_p4_minus = log10(kxx);
kzz_p4_minus = log10(kzz);
load([CASE '_p5+.mat'],'kxx','kzz');
kxx_p5_plus = log10(kxx);
kzz_p5_plus = log10(kzz);
load([CASE '_p5-.mat'],'kxx','kzz');
kxx_p5_minus = log10(kxx);
kzz_p5_minus = log10(kzz);
load([CASE '_p6+.mat'],'kxx','kzz');
kxx_p6_plus = log10(kxx);
kzz_p6_plus = log10(kzz);
load([CASE '_p6-.mat'],'kxx','kzz');
kxx_p6_minus = log10(kxx);
kzz_p6_minus = log10(kzz);

%% Plotting settings
latx = {'Interpreter', 'latex'};
sz = [14, 12];
labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
nbins = 25;
cmap = copper(3);


fh = figure(randi(10000, 1, 1));
tiledlayout(2,6,'Padding', 'compact', 'TileSpacing', 'compact');
nexttile(1)
logMinP = min([kxx_base;kxx_p1_plus;kxx_p1_minus]);
logMaxP = max([kxx_base;kxx_p1_plus;kxx_p1_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p1_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p1_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;


nexttile(2)
logMinP = min([kxx_base;kxx_p2_plus;kxx_p2_minus]);
logMaxP = max([kxx_base;kxx_p2_plus;kxx_p2_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p2_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p2_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(3)
logMinP = min([kxx_base;kxx_p3_plus;kxx_p3_minus]);
logMaxP = max([kxx_base;kxx_p3_plus;kxx_p3_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p3_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p3_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(4)
logMinP = min([kxx_base;kxx_p4_plus;kxx_p4_minus]);
logMaxP = max([kxx_base;kxx_p4_plus;kxx_p4_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p4_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p4_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(5)
logMinP = min([kxx_base;kxx_p5_plus;kxx_p5_minus]);
logMaxP = max([kxx_base;kxx_p5_plus;kxx_p5_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p5_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p5_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(6)
logMinP = min([kxx_base;kxx_p6_plus;kxx_p6_minus]);
logMaxP = max([kxx_base;kxx_p6_plus;kxx_p6_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kxx_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kxx_p6_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kxx_p6_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(7)
logMinP = min([kzz_base;kzz_p1_plus;kzz_p1_minus]);
logMaxP = max([kzz_base;kzz_p1_plus;kzz_p1_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p1_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p1_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;


nexttile(8)
logMinP = min([kzz_base;kzz_p2_plus;kzz_p2_minus]);
logMaxP = max([kzz_base;kzz_p2_plus;kzz_p2_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p2_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p2_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(9)
logMinP = min([kzz_base;kzz_p3_plus;kzz_p3_minus]);
logMaxP = max([kzz_base;kzz_p3_plus;kzz_p3_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p3_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p3_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(10)
logMinP = min([kzz_base;kzz_p4_plus;kzz_p4_minus]);
logMaxP = max([kzz_base;kzz_p4_plus;kzz_p4_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p4_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p4_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(11)
logMinP = min([kzz_base;kzz_p5_plus;kzz_p5_minus]);
logMaxP = max([kzz_base;kzz_p5_plus;kzz_p5_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p5_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p5_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

nexttile(12)
logMinP = min([kzz_base;kzz_p6_plus;kzz_p6_minus]);
logMaxP = max([kzz_base;kzz_p6_plus;kzz_p6_minus]);
edges = linspace(fix(logMinP)-1, fix(logMaxP)+1, nbins);
histogram(kzz_base, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(2,:), 'FaceAlpha', 0.5);
hold on;
histogram(kzz_p6_plus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(1,:), 'FaceAlpha', 0.5);
histogram(kzz_p6_minus, edges, 'Normalization', 'probability', ...
        'FaceColor',  cmap(3,:), 'FaceAlpha', 0.5);
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
ylabel('P [-]', latx{:}, 'fontSize', sz(2));
xlim([fix(logMinP)-1 fix(logMaxP)+1]);
%ylim([0 1]); yticks(0:.2:1);
grid on;

set(fh, 'position', [100, 100, 1800, 300]);
end


function plot_tornado(CASE,p)
latx = {'Interpreter', 'latex'};
sz = [14, 12];
labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
cmap = copper(3);

load([CASE '_baseline.mat'],'kxx','kzz');
kxx_base = log10(kxx);
kzz_base = log10(kzz);
load([CASE '_p1+.mat'],'kxx','kzz');
kxx_p1_plus = log10(kxx);
kzz_p1_plus = log10(kzz);
load([CASE '_p1-.mat'],'kxx','kzz');
kxx_p1_minus = log10(kxx);
kzz_p1_minus = log10(kzz);
load([CASE '_p2+.mat'],'kxx','kzz');
kxx_p2_plus = log10(kxx);
kzz_p2_plus = log10(kzz);
load([CASE '_p2-.mat'],'kxx','kzz');
kxx_p2_minus = log10(kxx);
kzz_p2_minus = log10(kzz);
load([CASE '_p3+.mat'],'kxx','kzz');
kxx_p3_plus = log10(kxx);
kzz_p3_plus = log10(kzz);
load([CASE '_p3-.mat'],'kxx','kzz');
kxx_p3_minus = log10(kxx);
kzz_p3_minus = log10(kzz);
load([CASE '_p4+.mat'],'kxx','kzz');
kxx_p4_plus = log10(kxx);
kzz_p4_plus = log10(kzz);
load([CASE '_p4-.mat'],'kxx','kzz');
kxx_p4_minus = log10(kxx);
kzz_p4_minus = log10(kzz);
load([CASE '_p5+.mat'],'kxx','kzz');
kxx_p5_plus = log10(kxx);
kzz_p5_plus = log10(kzz);
load([CASE '_p5-.mat'],'kxx','kzz');
kxx_p5_minus = log10(kxx);
kzz_p5_minus = log10(kzz);
load([CASE '_p6+.mat'],'kxx','kzz');
kxx_p6_plus = log10(kxx);
kzz_p6_plus = log10(kzz);
load([CASE '_p6-.mat'],'kxx','kzz');
kxx_p6_minus = log10(kxx);
kzz_p6_minus = log10(kzz);

basexx = prctile(kxx_base, p);
lowxx_vals = [prctile(kxx_p1_minus, p),...
            prctile(kxx_p2_minus, p),...
            prctile(kxx_p3_minus, p),...
            prctile(kxx_p4_minus, p),...
            prctile(kxx_p5_minus, p),...
            prctile(kxx_p6_minus, p)];
highxx_vals = [prctile(kxx_p1_plus, p),...
            prctile(kxx_p2_plus, p),...
            prctile(kxx_p3_plus, p),...
            prctile(kxx_p4_plus, p),...
            prctile(kxx_p5_plus, p),...
            prctile(kxx_p6_plus, p)];
basezz = prctile(kzz_base, p);
lowzz_vals = [prctile(kzz_p1_minus, p),...
            prctile(kzz_p2_minus, p),...
            prctile(kzz_p3_minus, p),...
            prctile(kzz_p4_minus, p),...
            prctile(kzz_p5_minus, p),...
            prctile(kzz_p6_minus, p)];
highzz_vals = [prctile(kzz_p1_plus, p),...
            prctile(kzz_p2_plus, p),...
            prctile(kzz_p3_plus, p),...
            prctile(kzz_p4_plus, p),...
            prctile(kzz_p5_plus, p),...
            prctile(kzz_p6_plus, p)];

% Example variable names
variables = {'$V_{cl}^{FW_1}$', '$V_{cl}^{FW_1}$', '$V_{cl}^{HW}$', '$f_\beta$', '$z_f$','$z_{max}$'};

% Calculate deviations from baseline
negxx_dev = lowxx_vals- basexx;
posxx_dev = highxx_vals- basexx;
negzz_dev = lowzz_vals- basezz;
poszz_dev = highzz_vals-basezz;

fh=figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 3,5]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [3,5]);
set(fh, 'PaperPosition', [0, 0, 3,5]);
tiledlayout(2, 1, 'Padding', 'compact');
nexttile(1)
hb = barh(1:length(variables), [negxx_dev(:), posxx_dev(:)], 'stacked');
hb(1).FaceColor = cmap(3,:); 
hb(2).FaceColor = cmap(1,:); 
set(gca, 'ytick', 1:length(variables), 'yticklabel', variables,'TickLabelInterpreter', 'latex', 'fontSize', sz(2));
xlabel(labls(1), latx{:}, 'fontSize', sz(2));
lgd = legend({'-', '+'}, 'Location', [0.8, 0.79, 1, 1],latx{:}, 'fontSize', sz(2),'box','off');
lgd.ItemTokenSize = [5, 1];

nexttile(2)
hb = barh(1:length(variables), [negzz_dev(:), poszz_dev(:)], 'stacked');
hb(1).FaceColor = cmap(3,:); 
hb(2).FaceColor = cmap(1,:); 
set(gca, 'ytick', 1:length(variables), 'yticklabel', variables,'TickLabelInterpreter', 'latex', 'fontSize', sz(2));
xlabel(labls(2), latx{:}, 'fontSize', sz(2));
lgd = legend({'-', '+'}, 'Location', [0.8, 0.29, 1, 1],latx{:}, 'fontSize', sz(2),'box','off');
lgd.ItemTokenSize = [5, 1];

print(fh, sprintf('Tornado-%s-%d.pdf', CASE, p), '-dpdf', '-r300');
end


