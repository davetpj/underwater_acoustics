clear all; close all; clc


f=1:10:1e6;
N1=107-30*log10(f);
Sd=0;
Sc=1;
v=[1 5 10 15];
v_knot=v.*1.944;

for a=1:length(f)
        
N2(a)=76-20*(log10(f(a))-log10(30)).^2+10*(Sd-0.5);
    
end

for a=1:length(f)
    for b=1:length(v_knot)
        if f(a)/1000<=1
             N3(a,b)=44+sqrt(21*v_knot(b))+17*(3-log10(f(a)))*(log10(f(a))-2);
        else
             N3(a,b)=95+sqrt(21*v_knot(b))-17*log10(f(a));
        end
    end    
end

N4 = -75+20*log10(f);

N_kT1=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,1).'/10)+10.^(N4/10))+10*(0.5*Sc+1);
N_kT5=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,2).'/10)+10.^(N4/10))+10*(0.5*Sc+1);
N_kT10=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,3).'/10)+10.^(N4/10))+10*(0.5*Sc+1);
N_kT15=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,4).'/10)+10.^(N4/10))+10*(0.5*Sc+1);
N_T1=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,1).'/10)+10.^(N4/10));
N_T5=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,2).'/10)+10.^(N4/10));
N_T10=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,3).'/10)+10.^(N4/10));
N_T15=10*log10(10.^(N1/10)+10.^(N2/10)+10.^(N3(:,4).'/10)+10.^(N4/10));
figure;
semilogx(f/1000,N_kT1,'b--','linewidth',2); hold on; grid on
semilogx(f/1000,N_kT5,'g--','linewidth',2);
semilogx(f/1000,N_kT10,'m--','linewidth',2);
semilogx(f/1000,N_kT15,'c--','linewidth',2);
semilogx(f/1000,N_T1,'b','linewidth',2);
semilogx(f/1000,N_T5,'g','linewidth',2);
semilogx(f/1000,N_T10,'m','linewidth',2);
semilogx(f/1000,N_T15,'c','linewidth',2);

set(gcf,'color','w','position',[150 280 800 400])
h=title('AMBIENT NOISE SPECTRUM LEVEL'); set(h,'fontsize',13,'fontweight','bold')
h=xlabel('Frequency (kHz)'); set(h,'fontsize',13,'fontweight','bold')
h=ylabel('AMBIENT NOISE LEVEL [dB re 1\muPa/Hz]'); set(h,'fontsize',13,'fontweight','bold')
legend('Wind speed : 1m/s','Wind speed : 5m/s','Wind speed : 10m/s','Wind speed : 15m/s','Wind speed : 1m/s','Wind speed : 5m/s','Wind speed : 10m/s','Wind speed : 15m/s')
ylim([20 110]);

