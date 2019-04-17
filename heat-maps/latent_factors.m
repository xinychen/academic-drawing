load latent_factors;

% figure #1 (factor2)
figure('DefaultAxesFontSize',16);
ax = gca;

imagesc(factor2);
colormap hot;
ax.YTick = [1,6,11,16,21,26,31,36,41,46,51,56,61];
ax.YTickLabel = ['08-01';'08-06';'08-11';'08-16';'08-21';'08-26';'08-31';...
    '09-05';'09-10';'09-15';'09-20';'09-25';'09-30'];

set(gcf, 'PaperSize', [3 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 3 10]);
saveas(gcf,'factor2','pdf');

% figure #2 (factor3)
figure('DefaultAxesFontSize',16);
ax = gca;

imagesc(factor3);
c = colorbar;
colormap hot;
ax.YTick = [1,13,25,37,49,61,73,85,97,109,121,133,144];
ax.YTickLabel = ['00:00';'02:00';'04:00';'06:00';'08:00';'10:00';'12:00';...
    '14:00';'16:00';'18:00';'20:00';'22:00';'23:50'];

set(gcf, 'PaperSize', [3 10]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 3 10]);
saveas(gcf,'factor3','pdf');