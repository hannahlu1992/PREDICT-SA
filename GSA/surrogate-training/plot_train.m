% clear all;
% close all;
% msq2mD = 9.869e-16;
% load("validation_data.mat",'Perm_CSS');
% Perm_CSS_test = log10(Perm_CSS)-log10(msq2mD);
% load("validation_data.mat",'Perm_CSC');
% Perm_CSC_test = log10(Perm_CSC)-log10(msq2mD);
% load("validation_data.mat",'Perm_SCC');
% Perm_SCC_test = log10(Perm_SCC)-log10(msq2mD);
% load("validation_data.mat",'Perm_SCS');
% Perm_SCS_test = log10(Perm_SCS)-log10(msq2mD);
% CSStest_xx_p10 = prctile(Perm_CSS_test(1,:),10);
% CSStest_xx_p50 = prctile(Perm_CSS_test(1,:),50);
% CSStest_xx_p90 = prctile(Perm_CSS_test(1,:),90);
% CSStest_zz_p10 = prctile(Perm_CSS_test(3,:),10);
% CSStest_zz_p50 = prctile(Perm_CSS_test(3,:),50);
% CSStest_zz_p90 = prctile(Perm_CSS_test(3,:),90);
% CSCtest_xx_p10 = prctile(Perm_CSC_test(1,:),10);
% CSCtest_xx_p50 = prctile(Perm_CSC_test(1,:),50);
% CSCtest_xx_p90 = prctile(Perm_CSC_test(1,:),90);
% CSCtest_zz_p10 = prctile(Perm_CSC_test(3,:),10);
% CSCtest_zz_p50 = prctile(Perm_CSC_test(3,:),50);
% CSCtest_zz_p90 = prctile(Perm_CSC_test(3,:),90);
% SCCtest_xx_p10 = prctile(Perm_SCC_test(1,:),10);
% SCCtest_xx_p50 = prctile(Perm_SCC_test(1,:),50);
% SCCtest_xx_p90 = prctile(Perm_SCC_test(1,:),90);
% SCCtest_zz_p10 = prctile(Perm_SCC_test(3,:),10);
% SCCtest_zz_p50 = prctile(Perm_SCC_test(3,:),50);
% SCCtest_zz_p90 = prctile(Perm_SCC_test(3,:),90);
% SCStest_xx_p10 = prctile(Perm_SCS_test(1,:),10);
% SCStest_xx_p50 = prctile(Perm_SCS_test(1,:),50);
% SCStest_xx_p90 = prctile(Perm_SCS_test(1,:),90);
% SCStest_zz_p10 = prctile(Perm_SCS_test(3,:),10);
% SCStest_zz_p50 = prctile(Perm_SCS_test(3,:),50);
% SCStest_zz_p90 = prctile(Perm_SCS_test(3,:),90);
% 
% load("training_data.mat",'Perm_CSS');
% Perm_CSS = reshape(log10(Perm_CSS)-log10(msq2mD),[3,100,100]); %[3, Nsim, Nmc]
% load("training_data.mat",'Perm_CSC');
% Perm_CSC = reshape(log10(Perm_CSC)-log10(msq2mD),[3,100,100]);
% load("training_data.mat",'Perm_SCC');
% Perm_SCC = reshape(log10(Perm_SCC)-log10(msq2mD),[3,100,100]);
% load("training_data.mat",'Perm_SCS');
% Perm_SCS = reshape(log10(Perm_SCS)-log10(msq2mD),[3,100,100]);
% 
% train_xx = [reshape(Perm_CSS(1,:,:),[100,100]),reshape(Perm_CSC(1,:,:),[100,100]),...
%     reshape(Perm_SCC(1,:,:),[100,100]),reshape(Perm_SCS(1,:,:),[100,100])];
% train_zz = [reshape(Perm_CSS(3,:,:),[100,100]),reshape(Perm_CSC(3,:,:),[100,100]),...
%     reshape(Perm_SCC(3,:,:),[100,100]),reshape(Perm_SCS(3,:,:),[100,100])];
% train_xx_p10 = prctile(train_xx,10,1);
% train_xx_p50 = prctile(train_xx,50,1);
% train_xx_p90 = prctile(train_xx,90,1);
% train_zz_p10 = prctile(train_zz,10,1);
% train_zz_p50 = prctile(train_zz,50,1);
% train_zz_p90 = prctile(train_zz,90,1);
% 
% latx = {'Interpreter', 'latex'};
% sz = [14, 12];
% labls = ["$\log_{10}(k_{xx}$ [mD])", "$\log_{10}(k_{zz}$ [mD])"];
% nbins = 50;
% cmap = copper(5);
% 
% fh = figure(randi(10000, 1, 1));
% set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 5]); % [x, y, width, height]
% set(fh, 'PaperUnits', 'inches');
% set(fh, 'PaperSize', [10, 5]);
% set(fh, 'PaperPosition', [0, 0, 10, 5]);
% tiledlayout(2,3,'Padding', 'compact', 'TileSpacing', 'compact');
% 
% nexttile(1)
% edges = linspace(fix(min(train_xx_p10))-0.5, fix(max(train_xx_p10))+0.5, nbins);
% hold on;
% histogram(train_xx_p10, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_xx_p10,CSCtest_xx_p10],[0,0.15],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_xx_p10,CSStest_xx_p10],[0,0.03],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_xx_p10,SCCtest_xx_p10],[0,0.15],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_xx_p10,SCStest_xx_p10],[0,0.15],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$10^{th}$ percentile of $\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% 
% h1 = plot(NaN, NaN, '-', 'Color', cmap(1,:), 'LineWidth', 1.5);
% h2 = plot(NaN, NaN, '--', 'Color', cmap(2,:), 'LineWidth', 1.5);
% h3 = plot(NaN, NaN, '--', 'Color', cmap(3,:), 'LineWidth', 1.5);
% h4 = plot(NaN, NaN, '--', 'Color', cmap(4,:), 'LineWidth', 1.5);
% h5 = plot(NaN, NaN, '--', 'Color', cmap(5,:), 'LineWidth', 1.5);
% lgd = legend([h1, h2, h3, h4,h5], {'training data', 'test CSC','test CSS','test SCC','test SCS'}, latx{:}, ...
%    'FontSize', sz(2), 'Box', 'off', 'Location', 'best');
% lgd.ItemTokenSize = [15, 8]; 
% nexttile(2)
% edges = linspace(fix(min(train_xx_p50))-0.5, fix(max(train_xx_p50))+0.5, nbins);
% hold on;
% histogram(train_xx_p50, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_xx_p50,CSCtest_xx_p50],[0,0.15],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_xx_p50,CSStest_xx_p50],[0,0.03],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_xx_p50,SCCtest_xx_p50],[0,0.15],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_xx_p50,SCStest_xx_p50],[0,0.15],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$50^{th}$ percentile of $\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% nexttile(3)
% edges = linspace(fix(min(train_xx_p90))-0.5, fix(max(train_xx_p90))+0.5, nbins);
% hold on;
% histogram(train_xx_p90, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_xx_p90,CSCtest_xx_p90],[0,0.15],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_xx_p90,CSStest_xx_p90],[0,0.03],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_xx_p90,SCCtest_xx_p90],[0,0.15],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_xx_p90,SCStest_xx_p90],[0,0.15],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$90^{th}$ percentile of $\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% 
% nexttile(4)
% edges = linspace(fix(min(train_zz_p10))-0.5, fix(max(train_zz_p10))+0.5, nbins);
% hold on;
% histogram(train_zz_p10, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_zz_p10,CSCtest_zz_p10],[0,0.05],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_zz_p10,CSStest_zz_p10],[0,0.04],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_zz_p10,SCCtest_zz_p10],[0,0.07],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_zz_p10,SCStest_zz_p10],[0,0.07],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$10^{th}$ percentile of $\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% 
% nexttile(5)
% edges = linspace(fix(min(train_zz_p50))-0.5, fix(max(train_zz_p50))+0.5, nbins);
% hold on;
% histogram(train_zz_p50, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_zz_p50,CSCtest_zz_p50],[0,0.08],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_zz_p50,CSStest_zz_p50],[0,0.05],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_zz_p50,SCCtest_zz_p50],[0,0.08],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_zz_p50,SCStest_zz_p50],[0,0.08],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$50^{th}$ percentile of $\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% nexttile(6)
% edges = linspace(fix(min(train_zz_p90))-0.5, fix(max(train_zz_p90))+0.5, nbins);
% hold on;
% histogram(train_zz_p90, edges, 'Normalization', 'probability', ...
%      'EdgeColor', cmap(1,:), 'LineWidth', 1.5, 'DisplayStyle', 'stairs');
% plot([CSCtest_zz_p90,CSCtest_zz_p90],[0,0.15],'Color',cmap(2,:),'LineWidth',1,'LineStyle','-.');
% plot([CSStest_zz_p90,CSStest_zz_p90],[0,0.0],'Color',cmap(3,:),'LineWidth',1,'LineStyle','-.');
% plot([SCCtest_zz_p90,SCCtest_zz_p90],[0,0.15],'Color',cmap(4,:),'LineWidth',1,'LineStyle','-.');
% plot([SCStest_zz_p90,SCStest_zz_p90],[0,0.15],'Color',cmap(5,:),'LineWidth',1,'LineStyle','-.');
% xlabel("$90^{th}$ percentile of $\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));
% ylabel('P [-]', latx{:}, 'FontSize', sz(2));
% print(fh, 'train-vis-updated.pdf', '-dpdf', '-r300'); 



load("training_data.mat",'params_CSC');
load("training_data.mat",'params_CSS');
load("training_data.mat",'params_SCC');
load("training_data.mat",'params_SCS');
p1 = [params_CSC.Vcl_fw_bot;params_CSS.Vcl_fw_bot;params_SCC.Vcl_fw_bot;params_SCS.Vcl_fw_bot];
p2 = [params_CSC.Vcl_fw_top;params_CSS.Vcl_fw_top;params_SCC.Vcl_fw_top;params_SCS.Vcl_fw_top];
p3 = [params_CSC.Vcl_hw;params_CSS.Vcl_hw;params_SCC.Vcl_hw;params_SCS.Vcl_hw];
p4 = [params_CSC.FaultDip;params_CSS.FaultDip;params_SCC.FaultDip;params_SCS.FaultDip];
p5 = [params_CSC.Zf;params_CSS.Zf;params_SCC.Zf;params_SCS.Zf];
p6 = [params_CSC.Zmax;params_CSS.Zmax;params_SCC.Zmax;params_SCS.Zmax];

idx = 1:100;

fh = figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 5]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [10, 5]);
set(fh, 'PaperPosition', [0, 0, 10, 5]);
tiledlayout(2,3,'Padding', 'compact', 'TileSpacing', 'compact');
variables = {'$V_{cl}^{FW_1}$', '$V_{cl}^{FW_2}$', '$V_{cl}^{HW}$', '$f_\beta$', '$z_f$','$z_{max}$'};
nexttile(1)
hold on;
scatter(p1(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p1(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p1(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(1), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));
ylim([-7,-4])
legend({'$10^{th}$','$50^{th}$','$90^{th}$'}, latx{:}, 'FontSize', sz(2), 'Box', 'off', 'Location', 'north','NumColumns',3);

nexttile(2)
hold on;
scatter(p2(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p2(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p2(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(2), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(3)
hold on;
scatter(p3(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p3(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p3(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(3), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(4)
hold on;
scatter(p4(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p4(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p4(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(4), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(5)
hold on;
scatter(p5(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p5(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p5(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(5), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(6)
hold on;
scatter(p6(idx),train_xx_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p6(idx),train_xx_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p6(idx),train_xx_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(6), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{xx}$ [mD])", latx{:}, 'FontSize', sz(2));
print(fh, 'CSC-train-p-kxx-updated.pdf', '-dpdf', '-r300'); 

fh = figure(randi(10000, 1, 1));
set(fh, 'Units', 'inches', 'Position', [1, 1, 10, 5]); % [x, y, width, height]
set(fh, 'PaperUnits', 'inches');
set(fh, 'PaperSize', [10, 5]);
set(fh, 'PaperPosition', [0, 0, 10, 5]);
tiledlayout(2,3,'Padding', 'compact', 'TileSpacing', 'compact');
variables = {'$V_{cl}^{FW_1}$', '$V_{cl}^{FW_2}$', '$V_{cl}^{HW}$', '$f_\beta$', '$z_f$','$z_{max}$'};
nexttile(1)
hold on;
scatter(p1(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p1(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p1(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(1), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));
% legend({'$10^{th}$','$50^{th}$','$90^{th}$'}, latx{:}, 'FontSize', sz(2), 'Box', 'off', 'Location', 'best');

nexttile(2)
hold on;
scatter(p2(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p2(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p2(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(2), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(3)
hold on;
scatter(p3(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p3(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p3(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(3), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(4)
hold on;
scatter(p4(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p4(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p4(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(4), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(5)
hold on;
scatter(p5(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p5(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p5(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(5), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));

nexttile(6)
hold on;
scatter(p6(idx),train_zz_p10(idx),10,cmap(1,:),'o','filled','MarkerFaceAlpha',0.5);
scatter(p6(idx),train_zz_p50(idx),10,cmap(3,:),'d','filled','MarkerFaceAlpha',0.5);
scatter(p6(idx),train_zz_p90(idx),10,cmap(5,:),'s','filled','MarkerFaceAlpha',0.5);
xlabel(variables(6), latx{:}, 'FontSize', sz(2));
ylabel("$\log_{10}(k_{zz}$ [mD])", latx{:}, 'FontSize', sz(2));
print(fh, 'CSC-train-p-kzz-updated.pdf', '-dpdf', '-r300'); 