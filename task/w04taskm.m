clear all;
close all;
clc;
set(gcf,'position', [177 63 1000 600],'color',[0 1 0]);
subplot(2,2,1)
a = -100 : 10 : 100;
b = a
plot(a,b,'b-o','MarkerEdgeColor','r','linewidth',2,'MarkerSize',5)

xticks(-100:50:100);
yticks(-100:50:100);
title('1차 함수')
h= xlabel('x value','fontsize',[13],'fontweight','bold');
g= ylabel('y value','fontsize',[13],'fontweight','bold');
legend('1차함수','Location','southeast')


subplot(2,2,2)
a = -100: 10 : 100;
b = 100*b.^2
plot(a,b,'y-d','MarkerEdgeColor','k','linewidth',2,'MarkerSize',5)
title("2차함수")
h= xlabel('x value','fontsize',[13],'fontweight','bold');
g= ylabel('y value','fontsize',[13],'fontweight','bold');
legend('2차함수','Location','southwest')



subplot(2,2,3:4)
b = -100:10:100
a = 66*b.^3
plot(b,a,'g-s','MarkerEdgeColor','k','linewidth',2,'MarkerSize',7)
title("3차함수")
grid on
xticks(-100:20:100);
h= xlabel('y value','fontsize',[13],'fontweight','bold');
g= ylabel('x value','fontsize',[13],'fontweight','bold');
legend('3차함수','Location','northwest')