clear all;
close all;
clc;

name = 'Pacific White Sided Dolphin';
[data, fs] = audioread('PacificWhiteSided.wav');

t = (1:size(data, 1))/fs;

set(gcf,'position',[300 300 1000 350],'color',[1 1 1]);
subplot(2,2,1);
plot(t,data(:,1)/max(data(:,1)));
p=xlabel('TIME(sec)');set(p,'fontsize',13,'fontweight','bold'); 
p=ylabel('Nomalized amplitude');set(p,'fontsize',13,'fontweight','bold'); 
p=title(name);set(p,'fontsize',16,'fontweight','bold'); 
set(gca,'fontsize',15,'fontweight','bold');
xlim([0 t(end)])


%%신호의 주파수 분석
[pow_ch1, f1] = pwelch(data(:,1), [], [], 2^13, fs);
%figure;set(gcf, 'position', [117 200 900 300], 'color', [1,1,1]);
subplot(2,2,2);
plot(f1, 10*log10(pow_ch1))
p=xlabel('Frequency (Hz)');set(p, 'fontsize',13,'fontweight','b');
p=title(name);set(p,'fontsize',16,'fontweight','bold');
set(gca,'fontsize',15,'fontweight','b')
xlim([0 10000])
ylim([-140 -60])

%%specgram 시간에 따른 주파수 분석
subplot(2,2,4);
specgram(data(:,1), 2^10, fs)
% nfft = min(256, length(sig));
% specgram(data(:,1), length(sig), fs)
p=ylabel('Frequency (Hz)');set(p, 'fontsize',13,'fontweight','b');
p=xlabel('TIME(sec)');set(p,'fontsize',13,'fontweight','b');
p=title(name);set(p,'fontsize',16,'fontweight','bold'); 
colormap('hot')
colorbar
caxis([-5 10])
ylim([0 10000 ])


