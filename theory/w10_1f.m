%Bottom reflection loss 해저면에서 반사가 얼마나?
%snell's law 이용
%반사계수 구하기

clear all;
close all;
clc;

% density
rho1 = 1; %(kg/m^3)
rho2 = 2; %(kg/m^3)

% Sound Speed
c1 = 1500;
c2 = 1800;

%degree
theta1 = (0:0.1:90) * pi / 180;
theta2 = acos(c2 / c1 * cos(theta1));

%Reflection coefficient
R12 = (rho2 * c2 * sin(theta1) - rho1 * c1 * sin(theta2)) ./ ...
    (rho2 * c2 * sin(theta1) + rho1 * c1 * sin(theta2));

%Reflection loss
RL = -20 * log10(abs(R12));

figure;
plot(theta1 * 180 / pi, abs(R12))
xlabel('grazing angle')
ylabel('reflection loss')

figure;
plot(theta1 * 180 / pi, RL)
xlabel('grazing angle')
ylabel('reflection loss')

%%

rho3 = 2.4;
c3 = 3000;
rho4 = 2;
c4 = 1800;
rho5 = 1.9;
c5 = 1650;
rho6 = 1.7;
c6 = 1575;
rhomat = [rho3, rho4, rho5, rho6];
cmat = [c3, c4, c5, c6];

theta1 = (0:0.1:90) * pi / 180;

%Reflection coefficient

for ii = 1:4
    currho = rhomat(ii);
    curc = cmat(ii);

    theta2 = acos(curc / c1 * cos(theta1));
    R12(ii, :) = (currho * curc * sin(theta1) - rho1 * c1 * sin(theta2)) ./ ...
        (currho * curc * sin(theta1) + rho1 * c1 * sin(theta2));
    RL(ii, :) = -20 * log10(abs(R12(ii, :)));
end

figure;
plot(theta1 * 180 / pi, abs(R12))
xlabel('grazing angle')
ylabel('reflection loss')
legend('limestone', 'gravel', 'send', 'silt')

figure;
plot(theta1 * 180 / pi, RL)
xlabel('grazing angle')
ylabel('reflection loss')
legend('limestone', 'gravel', 'send', 'silt')
