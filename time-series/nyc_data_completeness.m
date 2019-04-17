clear;
data = load('data_completeness.mat');
data = data.data;

orange = [ 0.91,0.41,0.17];
blue = [0,0.4470,0.7410];
figure('DefaultAxesFontSize',14);
ax = gca;
xlabel('Month');

yyaxis left;
h1 = plot(data(:,1),'-','color',blue,'linewidth',2,'DisplayName','rmse');
ylabel('Data amount (\times 10^6)');
ylim([0,1.6e+6]);
ax.YTick = 0:0.4e+6:1.6e+6;
ax.YTickLabel = ['0  ';'0.4';'0.8';'1.2';'1.6'];
yyaxis right;
h2 = plot(data(:,2),'-','color',orange,'linewidth',2,'DisplayName','lb');
ylabel('Completeness');
ax.YTick = 0:0.25:1;
ax.YTickLabel = 0:0.25:1;

box on;
grid on;
ax.XTick = 1:4:48;
ax.XTickLabel = ['Apr.';'Aug.';'Dec.';'Apr.';'Aug.';'Dec.';'Apr.';'Aug.';'Dec.';'Apr.';'Aug.';'Dec.';];
ax.GridLineStyle = '-.';
set(gcf, 'PaperSize', [8 3]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 8 3]);
saveas(gcf,'nyc_data_completeness','pdf');