%% overfitting #1
data = importdata('BCPF_fiber_rmselb_m30_r5.csv');
rmse = data(1:10,:);
lb = data(11:20,:);

color = [55,126,184]/255;
gray = [211,211,211]/255;
orange = [ 0.91,0.41,0.17];
blue = [0,0.4470,0.7410];
light_blue = [0.5843,0.8157,0.9882];
light_red =  [255,204,204]/255;

figure('DefaultAxesFontSize',16);
ax = gca;

yyaxis left;
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(rmse(:,1)),min(rmse(:,1)),min(rmse),min(rmse(:,end)),max(rmse(:,end)),fliplr(max(rmse))];
hold on;
s = fill(xbound,ybound,color,'EdgeColor',gray,'linewidth',0.5);
alpha(s,0.10);
hold on;
plot(rmse','-','color',light_blue,'linewidth',0.5);
hold on;
h1 = plot(mean(rmse),'-','color',blue,'linewidth',2,'DisplayName','rmse');

box on;
grid on;
ax.XTick = [0,25,50,100,200];
ax.XTickLabel = [0,25,50,100,200];
ylim([4.60,5.60]);
ax.YTick = [4.60,4.70,4.80,4.90,5.10,5.60];
ax.YTickLabel = ['4.60';'4.70';'4.80';'4.90';'5.10';'5.60'];
ax.GridLineStyle = '-.';
xlabel('Epoch');
ylabel('RMSE (km/h)');

yyaxis right;
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(lb(:,1)),min(lb(:,1)),min(lb),min(lb(:,end)),max(lb(:,end)),fliplr(max(lb))];
hold on;
s = fill(xbound,ybound,gray,'EdgeColor',gray,'linewidth',0.5);
alpha(s,0.10);
hold on;
plot(lb','-','color',light_red,'linewidth',0.5);
hold on;
h2 = plot(mean(lb),'-','color',orange,'linewidth',2,'DisplayName','lb');
ylim([-1.24e7,-1.19e7]);
ylabel('Lower bound');

legend([h1,h2],{'Average of RMSE';'Average of lower bound'},'location','north');

set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'overfitting_ms30_r5','pdf');

%% overfitting #2
data = importdata('BCPF_fiber_rmselb_m30_r10.csv');
rmse = data(1:10,:);
lb = data(11:20,:);

figure('DefaultAxesFontSize',16);
ax = gca;

yyaxis left;
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(rmse(:,1)),min(rmse(:,1)),min(rmse),min(rmse(:,end)),max(rmse(:,end)),fliplr(max(rmse))];
hold on;
s = fill(xbound,ybound,color,'EdgeColor',gray,'linewidth',0.5);
alpha(s,0.10);
hold on;
plot(rmse','-','color',light_blue,'linewidth',0.5);
hold on;
h1 = plot(mean(rmse),'-','color',blue,'linewidth',2,'DisplayName','rmse');

box on;
grid on;
ax.XTick = [0,25,50,100,200];
ax.XTickLabel = [0,25,50,100,200];
ylim([4.35,8.60]);
ax.YTick = [4.35,4.60,4.90,5.20,6.00,8.60];
ax.YTickLabel = ['4.35';'4.60';'4.90';'5.20';'6.00';'8.60'];
ax.GridLineStyle = '-.';
xlabel('Epoch');
ylabel('RMSE (km/h)');

yyaxis right;
xbound = [1,1,1:200,200,200,fliplr(1:200)];
ybound = [max(lb(:,1)),min(lb(:,1)),min(lb),min(lb(:,end)),max(lb(:,end)),fliplr(max(lb))];
hold on;
s = fill(xbound,ybound,gray,'EdgeColor',gray,'linewidth',0.5);
alpha(s,0.10);
hold on;
plot(lb','-','color',light_red,'linewidth',0.5);
hold on;
h2 = plot(mean(lb),'-','color',orange,'linewidth',2,'DisplayName','lb');
ylim([-1.205e7,-1.19e7]);
ylabel('Lower bound');

legend([h1,h2],{'Average of RMSE';'Average of lower bound'},'location','north');

set(gcf, 'PaperSize', [6 4.5]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 4.5]);
saveas(gcf,'overfitting_ms30_r10','pdf');