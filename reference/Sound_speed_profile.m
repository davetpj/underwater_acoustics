clc
clear;
close all;

fName = 'CTD_data.txt';
data = load(fName);
% data = load('CTD_data.txt');

% data = 
% [1=Scan count, 2=pressure, 3=depth, 
%  4=temperature, 5=conductivity, 
%  6=Oxygen, 7=salinity, 8=dynamic, 
%  9=density, 10=sound velocity, 11=flag]
dep = data(:, 3);
temp = data(:, 4);
sal = data(:, 7);
Sspeed = data(:, 10);
    
interval = 5;
dataIdx = 0;
for MatIdx = 1: interval : length(dep)
    dataIdx = dataIdx+1;
    dep_c(dataIdx) = dep(MatIdx);
    temp_c(dataIdx) = temp(MatIdx);
    sal_c(dataIdx) = sal(MatIdx);
end

Sspeed_cal = 1449.2 + 4.6*temp_c - 0.055*temp_c.^2 + 0.00029*temp_c.^3 ...
    + (1.34-0.01*temp_c).*(sal_c-35) + 0.016*dep_c;

% Sspeed_cal = CalSS(temp_c, sal_c, dep_c);

figure;set(gcf, 'color','w', 'position', [100 200 400 600] )
% measurements
plot(Sspeed,dep,'r-S','linewidth',3, ...
    'markeredgecolor','r','markersize',10);
hold on;
% calcuation
plot(Sspeed_cal,dep_c,'b-o','linewidth',3, ...
    'markeredgecolor','b','markersize',10);
axis ij
% �׸� title ����
title('Sound Speed Profile','fontsize',13,'fontweight','bold')        
% �׸� title ����
xlabel('Sound Speed (m/s)','fontsize',13,'fontweight','bold')    
% �׸� title ����
ylabel('Depth (m)','fontsize',13,'fontweight','bold')            
% axis, font, weight ����
set(gca,'fontsize',40,'fontweight','bold');                         
legend('Measurements', 'Calculation')


% �ٸ� ��� 1
interval = 8;
Idx = 1: interval : length(dep);
D = dep(Idx);
T = temp(Idx);
S = sal(Idx);
Sspeed_cal = Sspeed_cal
figure;set(gcf, 'color','w', 'position', [100 200 400 600] )
plot(Sspeed,dep,'r-S','linewidth',3,'markeredgecolor','r','markersize',10);
hold on;
plot(Sspeed_cal,D,'k-s','linewidth',2,'markerfacecolor','y','markeredgecolor','k','markersize',7);
title('Sound Speed Profile','fontsize',13,'fontweight','bold')        
xlabel('Sound Speed (m/s)','fontsize',13,'fontweight','bold')    
ylabel('Depth (m)','fontsize',13,'fontweight','bold')            
set(gca,'fontsize',12,'fontweight','bold');                         
legend('Measurements', 'Calculation')
axis ij

% ������ 2�� ����� �ƴϰ� 3�� ����� �ƴ� ���� ã��
Idx = find( rem(dep,2) ~=0 & rem(dep,3) ~=0 );
D = dep(Idx);
T = temp(Idx);
S = sal(Idx);
Sspeed_cal = Sspeed_cal
figure;set(gcf, 'color','w', 'position', [100 200 400 600] )
plot(Sspeed,dep,'r-S','linewidth',3,'markeredgecolor','r','markersize',10);
hold on;
plot(Sspeed_cal,D,'k-s','linewidth',2,'markerfacecolor','y','markeredgecolor','k','markersize',7);
title('Sound Speed Profile','fontsize',13,'fontweight','bold')        
xlabel('Sound Speed (m/s)','fontsize',13,'fontweight','bold')    
ylabel('Depth (m)','fontsize',13,'fontweight','bold')            
set(gca,'fontsize',12,'fontweight','bold');                         
legend('Measurements', 'Calculation')
axis ij

INTERP_Sspeed_cal_linear = interp1(D,Sspeed_cal,dep);
INTERP_Sspeed_cal_spline = interp1(D,Sspeed_cal,dep,'spline');

figure;set(gcf, 'color','w', 'position', [100 200 400 600] )
plot(Sspeed,dep,'r-S','linewidth',3,'markeredgecolor','r','markersize',10);
hold on;
plot(INTERP_Sspeed_cal_linear,dep,'k-s','linewidth',2,'markerfacecolor','y','markeredgecolor','k','markersize',7);
plot(INTERP_Sspeed_cal_spline,dep,'m-o','linewidth',2,'markerfacecolor','y','markeredgecolor','g','markersize',7);

title('Sound Speed Profile','fontsize',13,'fontweight','bold')        
xlabel('Sound Speed (m/s)','fontsize',13,'fontweight','bold')    
ylabel('Depth (m)','fontsize',13,'fontweight','bold')            
set(gca,'fontsize',12,'fontweight','bold');                         
legend('Measurements','Linear Interp.', 'spline Interp.')
axis ij

axis([1508 1515 65 73])

