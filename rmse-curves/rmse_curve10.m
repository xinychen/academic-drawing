load rmse10;

% Set colors.
color = [55,126,184]/255;

% Create a figure.
figure('DefaultAxesFontSize',16);
ax = gca;

% Plot the RMSE curves.
xbound = [1,1,1:500,500,500,fliplr(1:500)];
ybound = [max(rmse10(:,1)),min(rmse10(:,1)),min(rmse10),min(rmse10(:,end)),max(rmse10(:,end)),fliplr(max(rmse10))];
hold on;
plot(rmse10');
hold on;
s = fill(xbound,ybound,'y','EdgeColor',color,'linewidth',1);
alpha(s,0.1);
hold on;
h = plot(mean(rmse10),'color','r','linewidth',3,'DisplayName','method #2');

% Change settings and items.
box on;
grid on;
ax.XTick = [0,50,100,200,500];
ax.XTickLabel = [0,50,100,200,500];
ylim([4.10,4.40]);
ax.YTick = [4.10,4.12,4.14,4.16,4.18,4.20,4.25,4.40];
ax.YTickLabel = ['4.10';'4.12';'4.14';'4.16';'4.18';'4.20';'4.25';'4.40'];
ax.GridLineStyle = '-.';
xlabel('Iteration');
ylabel('RMSE (km/h)');
legend([h,s],{'Averaged Curve';'Curves Boundary'});

% Save the figure as "rmse_curve10.pdf".
set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'rmse_curve10','pdf');