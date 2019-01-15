clear;
data = importdata('road1_fiber_ms50_r10.csv');
data = data.data;

figure('DefaultAxesFontSize',16);
ax = gca;

hold on;plot(1:144,data(1:144,4),'k-.','linewidth',0.5);
hold on;plot(144+1:2*144,data(144+1:2*144,4),'color',[0,0.4470,0.7410],'linewidth',2);
hold on;plot(2*144+1:3*144,data(2*144+1:3*144,4),'k-.','linewidth',0.5);
hold on;plot(3*144+1:5*144,data(3*144+1:5*144,4),'color',[0,0.4470,0.7410],'linewidth',2);
hold on;plot(5*144+1:6*144,data(5*144+1:6*144,4),'k-.','linewidth',0.5);
hold on;plot(6*144+1:7*144,data(6*144+1:7*144,4),'color',[0,0.4470,0.7410],'linewidth',2);

ax.XTick = [144,2*144,3*144,4*144,5*144,6*144,7*144];
ax.XTickLabel = [' ';' ';' ';' ';' ';' ';' '];
ax.YTick = [0,60];
ax.YTickLabel = [' ';' '];
x = [144,2*144,2*144,144];
y = [10,10,50,50];

v1 = [144,0; 2*144,0; 2*144,60; 144,60];
v2 = v1; v2(:,1)=v1(:,1)+2*144;
v3 = v2; v3(:,1)=v2(:,1)+144;
v4 = v3; v4(:,1)=v3(:,1)+2*144;
f = [1,2,3,4];
patch('faces',f,'vertices',v1,'edgecolor',[0.5 0.5 0.5],'facecolor','green','facealpha',0.1);
patch('faces',f,'vertices',v2,'edgecolor',[0.5 0.5 0.5],'facecolor','green','facealpha',0.1);
patch('faces',f,'vertices',v3,'edgecolor',[0.5 0.5 0.5],'facecolor','green','facealpha',0.1);
patch('faces',f,'vertices',v4,'edgecolor',[0.5 0.5 0.5],'facecolor','green','facealpha',0.1);
xlim([10,50]);
xlim([0,7*144]);

grid on;
box off;

set(gcf, 'PaperSize', [6 2]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 6 2]);
saveas(gcf,'curve1','pdf');