clc;
close all;
clear all;
% frequency
f = 20; %kHz

% 입사각
theta = 0:1:90;

% windspeed
U = 0:0.1:15;

SBL = zeros(size(U))
% 이렇게도 만들수 있음
SBL = zeros(length(theta), length(U(1, :)));

for itheta = 1:length(theta)
    idx = find(U >= 6);

    %  91개를 같은 위치에 저장
    SBL(itheta, idx) = 1.26 * 10^(-3) / sin(theta(itheta) * pi / 180) * ...
        U(idx).^(1.57) * f^(0.85);

    idx = find(U < 6);

    %  91개를 같은 위치에 저장
    SBL(itheta, idx) = 1.26 * 10^(-3) / sin(theta(itheta) * pi / 180) * ...
        6^(1.57) * f^(0.85) * exp(1.2 * (U(idx) - 6));
end

figure;
plot(U, SBL)
xlabel('wind speed')
ylabel('surface loss')
grid on;
%legend('10 deg', '30 deg', '50 deg', '70 deg', 'location', 'nw')

figure;
pcolor(U, theta, SBL)
xlabel('wind speed')
ylabel('theta')
shading interp
axis ij
colormap('jet')
h = colorbar;
ylabel(h, 'surface loss(dB)')
caxis([0 10])
set(gca, 'fontsize', 13, 'fontweight', 'b')
