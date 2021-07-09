clc;clear;close all;

%% Data loading
data = load('CTD_data.txt');    % read CTD data
d = data(:,3);      % Depth
t = data(:,4);      % Temperature
s = data(:,7);      % Salinity
p = d/10;           % Pressure
sv = data(:,10);    % Sound velocity calculated by CTD

%% Medwin equation
c_med = 1449.2 + 4.6*t - 0.055*t.^2 + 0.00029*t.^3 + (1.34-0.01*t).*(s-35) + 0.016*d;

%% Del Grosso's equation
c = [1402.392 0.5012285e1 -0.551184e-1 0.221649e-3 0.1329530e1 0.1288598e-3 ...
    0.1560592 0.2449993e-4 -0.8833959e-8 -0.1275936e-1 0.6353509e-2 0.2656174e-7 ...
    -0.1593895e-5 0.5222483e-9 -0.4383615e-6 -0.1616745e-8 0.9688441e-4...
    0.4857614e-5 -0.3406824e-3];    % coefficients
c0 = c(1);      % 1st term
ct1 = c(2); 
ct2 = c(3); 
ct3 = c(4); 
cs1 = c(5);
cs2 = c(6); 
cp1 = c(7); 
cp2 = c(8); 
cp3 = c(9); 
cst = c(10);
ctp = c(11);
ct2p2 = c(12); 
ctp2 = c(13); 
ctp3 = c(14); 
ct3p = c(15);
cs2p2 = c(16); 
cst2 = c(17); 
cs2tp = c(18); 
cstp = c(19);

c_t = (ct1 + (ct2 + ct3*t).*t).*t;  % 2nd term
c_s = (cs1 + cs2*s).*s;             % 3rd term
c_p = (cp1 + (cp2 + cp3*p).*p).*p;  % 4th term
c_stp = cst*s.*t + ctp*t.*p + ctp2*t.*p.^2 + ct3p*t.^3.*p ...
    + ct2p2*t.^2.*p.^2 + ctp3*t.*p.^3 + cst2*s.*t.^2 + cstp*s.*t.*p ...
    + cs2tp*s.^2.*t.*p + cs2p2*s.^2.*p.^2;  % 5th term

c_del = c0 + c_t + c_s + c_p + c_stp;       % final equation

%% ploting
figure;
plot(c_med,d,'linewidth',2);
hold on
plot(c_del,d,'--r','linewidth',2);
legend('Medwin','Del Grosso''s','location','nw');
axis([1460 1540 0 100])
axis ij

