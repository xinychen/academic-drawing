% Load data "mu10.mat".
load mu10;

% Create a figure.
figure('DefaultAxesFontSize',16);
ax = gca;

% Plot the mu curves.
xbound = [1,1,1:500,500,500,fliplr(1:500)];
ybound = [mean(mu(:,1))+std(mu(:,1)),mean(mu(:,1))-std(mu(:,1)),mean(mu)-std(mu),...
    mean(mu(:,end))-std(mu(:,end)),mean(mu(:,end))+std(mu(:,end)),fliplr(mean(mu)+std(mu))];
hold on;
plot(mu','-','Color',[0.76,0.87,0.78]);
hold on;
s = fill(xbound,ybound,'y','EdgeColor','white');
alpha(s,0.20);
hold on;
h = plot(mean(mu),'Color','r','LineWidth',2);
hold on;
p = plot(39.01*ones(500,1),'-.','Color','magenta','LineWidth',2);

% Change settings and items.
box on;
grid on;
ax.XTick = [0,50,100,200,500];
ax.XTickLabel = [0,50,100,200,500];
ylim([38,40.5]);
ax.YTick = [38,38.5,38.75,39,39.25,39.50,39.75,40.5];
ax.YTickLabel = ['38.00';'38.50';'38.75';'39.00';'39.25';'39.50';'39.75';'40.50'];
ax.GridLineStyle = '-.';
xlabel('Iteration');
ylabel('Speed (km/h)');
legend([p,h],{'Mean of Observations', 'Model Parameter \mu'});

% Save the figure as "mu_curve10.pdf".
set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'mu_curve10','pdf');