clear all;
close all;
clc;

%% Sound Speed Profile

ax1 = subplot(1,4,1)
graphConstructor(1460,1520, 0 ,100);

ax2 = subplot(1,4,2)
graphConstructor(1513.5,1514, 0 ,20);

ax3 = subplot(1,4,3)
graphConstructor(1511, 1514, 40 ,60);

ax4 = subplot(1,4,4)
graphConstructor(1460,1500, 80 ,100);

%%
set(gcf,'Position',[200 400 1300 500])


%%
function graphConstructor(a,b,c,d)

%% Data

data = load('CTD_data.txt');
fName = 'CTD_data.txt';
data = load(fName);

%% global var
global delGrosso_C medwin_C z

% 1 Scan count
% 2 pressure
% 3 depth                v
% 4 temperature          v
% 5 conductivity
% 6 Oxygen
% 7 salinity             v
% 8 dynamic
% 9 density
% 10 sound velocity      v
% 11 flag

z = data(:,3)';
T = data(:,4)';
S = data(:,7)';
P = data(:,3)'/10;

% reference = data(:,10)';


%% Medwin's Equation

medwin_C = 1449.2 + 4.6*T - 0.055*T.^2 + 0.00029*T.^3 + (1.34-0.01*T).*(S-35) + 0.016*z;

%% Del Grosso's Equation

C0 = 1402.392
CT1 = 0.5012285e1
CT2 = -0.551184e-1
CT3 = 0.221649e-3
CS1 = 0.1329530e1
CS2 = 0.1288598e-3
CP1 = 0.1560592
CP2 = 0.2449993e-4
CP3 = -0.8833959e-8
CST = -0.1275936e-1
CTP = 0.6353509e-2
CT2P2 = 0.2656174e-7
CTP2 = -0.1593895e-5
CTP3 = 0.5222483e-9
CT3P = -0.4383615e-6
CS2P2 = -0.1616745e-8
CST2 = 0.9688441e-4
CS2TP = 0.4857614e-5
CSTP = -0.3406824e-3

dCT = (CT1 + (CT2 + CT3*T).*T).*T;  
dCS = (CS1 + CS2*S).*S;             
dCP = (CP1 + (CP2 + CP3*P).*P).*P;  
dCSTP = CST*S.*T + CTP*T.*P + CTP2*T.*P.^2 + CT3P*T.^3.*P ...
    + CT2P2*T.^2.*P.^2 + CTP3*T.*P.^3 + CST2*S.*T.^2 + CSTP*S.*T.*P ...
    + CS2TP*S.^2.*T.*P + CS2P2*S.^2.*P.^2;  

delGrosso_C = C0 + dCT+dCS+dCP+dCSTP

%%
x = medwin_C;
y = z;
z = delGrosso_C;
plot(x,y,'b-','linewidth',2)
hold on
plot(z,y,'g-','linewidth',2)

axis([a b c d])
axis ij
title("Sound Speed Profile","fontweight","bold")
xlabel("Sound Speed (m/s)","fontsize",[13],"fontweight","bold")
ylabel("Depth (m)","fontsize",[13],"fontweight","bold")
legend("Medwin's equation","Del Grosso's equation", "location", "northwest")

end