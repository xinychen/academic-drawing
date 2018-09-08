% Load data "bias20.mat".
clc;
clear;
load bias20;

% Create a figure.
figure('DefaultAxesFontSize',16);
ax = gca;

% Create a heatmap.
mat = bias{2}.*ones(61,144)+bias{3}'.*ones(61,144);
imagesc(mat);
c = colorbar;
colormap hot;
ylabel(c,'Speed (km/h)');
ax.XTick = [1,13,25,37,49,61,73,85,97,109,121,133,144];
ax.XTickLabel = ['00:00';'02:00';'04:00';'06:00';'08:00';'10:00';'12:00';...
    '14:00';'16:00';'18:00';'20:00';'22:00';'23:50'];
xtickangle(45);
ax.YTick = [1,6,11,16,21,26,31,36,41,46,51,56,61];
ax.YTickLabel = ['08-01';'08-06';'08-11';'08-16';'08-21';'08-26';'08-31';...
    '09-05';'09-10';'09-15';'09-20';'09-25';'09-30'];

% Save the figure as "heat_map20.pdf".
set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'heat_map20','pdf');