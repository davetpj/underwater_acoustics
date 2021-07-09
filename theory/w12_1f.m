clc;
close all;
clear all;
%% Wenz curve , Korea Wenz curve

f=1:10:1e6;
v = [1 5 10 15];
v_knot = v*1.944;


N1=107-30*log10(f);
N2=76-20*[log10(f)-log10(30)].^2+10*(sd-0.5); 

N3 = zeros()
for iv = 1:length(v_knot)
idx = find(f <= 1000);
N3(iv, idx)=44+sqrt(21*v_knot(iv))+17*[3-log10(f(idx))].*[log10(f(idx))-2];

idx = find(f > 1000);
N3(iv, idx)=95+sqrt(21*v_knot(iv))-17*log10(f(idx));
end





