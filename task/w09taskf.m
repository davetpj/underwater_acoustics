%% 2012041811kimdonghu
clear all;close all;clc;
f=1:0.001:100;
T=[0 10 20];
ph=8;
S=35;
z=0;
c=1481.6;

alpha_f=zeros(length(T),length(f));
alpha_s=zeros(length(T),length(f));
%%
for p=1:length(T)
    t=T(p);
   
    A1=8.68/c*10^(0.78*ph-5);
    p1=1;
    f1=2.8*(S/35)^0.5*10^(4-1245/(273+t));
    
    A2=21.44*S/c*(1+0.025*t);
    P2=1-137*10^-4*z+6.2*10^-9*z^2;
    f2=(8.17*10^(8-1990/(273+t)))/(1+0.0018*(S-35));
    
    if t<=20
        A3=4.937*10^-4-2.59*10^-5*t+9.11*10^-7*t^2-1.50*10^-8*t^3;
        P3=1-3.83*10^-5*z+4.9*10^-10*z^2;
    else
        A3=3.964*10^-4-1.146*10^-5*t+1.45*10^-7*t^2-6.50*10^-10+t^3;
        P3=1-3.83*10^-5*z+4.9*10^-10*z^2;
    end
    
    alpha_s(p,:)=(A1*p1*f1*f.^2)./(f.^2+f1^2)+(A2*P2*f2*f.^2)./(f.^2+f2^2)+A3*P3*f.^2;
    alpha_f(p,:)=A3*P3*f.^2;
        
end

%%
subplot(1,2,1);
loglog(f,alpha_s(1,:),f,alpha_s(2,:),f,alpha_s(3,:),'linewidth',2);
grid on;
title('Francois and Garrison attenuation model (Sea water)');
xlabel('Frequency (kHz)','fontsize',12,'fontweight','bold');
ylabel('Attenuation (dB/km)','fontsize',12,'fontweight','bold');
tmp=legend('Temp. deg. C : 0','Temp. deg. C : 10','Temp. deg. C : 20','location','northwest');
set(tmp,'fontweight','bold')
ylim([1e-3 1e2])

subplot(1,2,2);
loglog(f,alpha_f(1,:),f,alpha_f(2,:),f,alpha_f(3,:),'linewidth',2);
grid on;
title('Francois and Garrison attenuation model (Fresh water)');
xlabel('Frequency (kHz)','fontsize',12,'fontweight','bold');
ylabel('Attenuation (dB/km)','fontsize',12,'fontweight','bold');
tmp=legend('Temp. deg. C : 0','Temp. deg. C : 10','Temp. deg. C : 20','location','northwest');
set(tmp,'fontweight','bold')
ylim([1e-3 1e2])