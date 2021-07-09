%% Surface bubble loss 1
clc; close all; clear all;
% Frequency
f = 20; % (kHz)

% Angle of incidence
theta = 0:1:90; % (deg)

% Windspeed
U = 0:0.1:15; % (m/s)

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

%% Surface bubble loss 2 (if else)
clc; close all; clear all;
% Frequency
f = 20; % (kHz)

% Angle of incidence
theta = 0:1:90; % (deg)

% Windspeed
U = 0:0.1:15; % (m/s)

for a = 1:length(theta);

    for b = 1:length(U);

        if U(b) >= 6;
            SBL(a, b) = 1.26 * 10^(-3) ./ sind(theta(a)) * U(b)^1.57 * f^(0.85);
        else
            SBL(a, b) = 1.26 * 10^(-3) ./ sind(theta(a)) * 6^(1.57) * f^(0.85) * exp(1.2 * (U(b) - 6));

        end

    end

end

%% Visualization
figure;

pcolor(U, theta, SBL)
shading interp
axis ij

colormap('jet')

fg = title('Surface bubble loss(Frequency : 20kHz)');
set(fg, 'fontsize', 13, 'fontweight', 'bold');

fg = xlabel('Wind speed(m/s)');
set(fg, 'fontsize', 12, 'fontweight', 'bold');

fg = ylabel('Grazing angle (deg.)');
set(fg, 'fontsize', 12, 'fontweight', 'bold');

cbar = colorbar;
ylabel(cbar, 'Surface loss(dB)');
set(cbar, 'fontsize', 12, 'fontweight', 'bold');
caxis([0 10])
