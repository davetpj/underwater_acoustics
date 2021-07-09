clc
clear all
close all

%Frequency
freq = 4; %(Hz)

fs_real = 10000;
t_real = 0:1 / fs_real:1

sig_real = sin(2 * pi * freq * t_real);

%Sampling Frequency
fs = freq * 20; %(Hz)
t = 0:1 / fs:1

sig = sin(2 * pi * freq * t);

figure;
plot(t_real, sig_real, 'r')
hold on
plot(t, sig, 'b-o')
xlabel('time (sec)')
ylabel('amplitude')

clc
close all
clear all
%%주파수 분석 2가지로 할 수 있다.
%1 pwelch 주파수 성분만 분석
%2 specgram 시간에 따른 주파수 성분

freq1 = 5000;
fs = 100000;
T = 0:1 / fs:1;

sig = sin(2 * pi * freq1 * T);

figure;

plot(T, sig)

%1 pwelch

[pow_ch1, f1] = pwelch(sig, [], [], 2^13, fs);

figure; set(gcf, 'position', [177 200 900 300], 'color', [1, 1, 1]);
plot(f1, 10 * log(pow_ch1))
p = xlabel('Frequency (Hz)'); set(p, 'fontsize', 13, 'fontweight', 'b')
set(gca, 'fontsize', 15, 'fontweight', 'b')
xlim([0 10000])
