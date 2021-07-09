clear all; close all; clc

f=20;
th=0:1:90;
U=0:0.1:15;
for a = 1:length(th);
    for b = 1:length(U);
        if U(b)>=6;
            SBL(a,b)=1.26*10^(-3)./sind(th(a))*U(b)^1.57*f^(0.85);
        else
            SBL(a,b)=1.26*10^(-3)./sind(th(a))*6^(1.57)*f^(0.85)*exp(1.2*(U(b)-6));
            
        end
    end
end


figure; set(gcf,'position',[200 176 700 300], 'color',[1 1 1]);
pcolor(U,th,SBL);
colormap(jet)
shading interp
caxis([0 10])
axis ij
h=title('Surface bubble loss(Frequency : 20kHz)'); set(h,'fontsize',13,'fontweight','bold');
h=xlabel('Wind speed(m/s)'); set(h,'fontsize',12,'fontweight','bold');
h=ylabel('Grazing angle (deg.)'); set(h,'fontsize',12,'fontweight','bold');
A=colorbar; ylabel(A,'Surface loss(dB)'); set(A,'fontsize',12,'fontweight','bold');