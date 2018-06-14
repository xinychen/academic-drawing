% Load data "rmse.mat".
load rmse;

% Set colors.
color1 = [55,126,184]/255;
color2 = [1,0.6,0.78];
color3 =  [255,0,255]/255;

% Create a figure.
figure('DefaultAxesFontSize',14);
ax = gca;

% Plot the first RMSE curve.
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(rmse{1}(:,1)),min(rmse{1}(:,1)),min(rmse{1}),min(rmse{1}(:,end)),max(rmse{1}(:,end)),fliplr(max(rmse{1}))];
s = fill(xbound,ybound,'y','EdgeColor',color1,'linewidth',0.5);
alpha(s,0.1);
hold on;
h1 = plot(mean(rmse{1}),'color','r','linewidth',2,'DisplayName','method #1');

% Plot the second RMSE curve.
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(rmse{2}(:,1)),min(rmse{2}(:,1)),min(rmse{2}),min(rmse{2}(:,end)),max(rmse{2}(:,end)),fliplr(max(rmse{2}))];
hold on;
s = fill(xbound,ybound,color2,'EdgeColor',color1,'linewidth',0.5);
alpha(s,0.1);
hold on;
h2 = plot(mean(rmse{2}),'color',color3,'linewidth',2,'DisplayName','method #2');

% Change settings and items.
grid on;
ax.XTick = [0,25,50,100,200];
ax.XTickLabel = [0,25,50,100,200];
ylim([3.95,4.15]);
ax.YTick = [3.97,3.98,3.99,4.01,4.02,4.03,4.15];
ax.YTickLabel = [3.97,3.98,3.99,4.01,4.02,4.03,4.15];
ax.GridLineStyle = '-.';
xlabel('Iteration');
ylabel('RMSE (km/h)');
legend([h1,h2],{'method #1','method #2'});

% Save a figure in a format of "rmse_curve.pdf".
set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'rmse_curve','pdf');