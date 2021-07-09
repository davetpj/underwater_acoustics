feature('DefaultCharacterSet','UTF-8');
%% �??��?�� ?��중음?��?��로그?���? 3주차 과제
close all;
clear all;
clc;

%%
S = 35;
depth = [0,20,50,75,100];
T1  = [22,21,19,17,15];
T2  = [23,23,20,16.5,14];
T3  = [22.5,22,20.5,17,15];
T4  = [22,21,18.5,16,15];
T5  = [21,21,20,18,14];
Tn = {T1,T2,T3,T4,T5};
tempArr = [];
ssp = [];

%%
k = 1;
for x = Tn
    temp=cell2mat(x); 

    m = 0;
    while m < length(depth)
        m = m + 1; 
        T = temp(m); 
        z = depth(m);
        C = 1499.2 + (4.6*(T)) - (0.055*(T^2)) + (0.00029*(T^3)) + ((1.34 - 0.01*(T))*(S - 35)) + (0.016*(z))
        tempArr = [tempArr, C];
    end
    ssp(k,:) = tempArr;
    tempArr = [];
    k = k +1;
end
%%
disp(ssp)

%% ?���?
%{
close all;
clear all;
clc;


%% �??��?��?�� 
% ?���? (?��?��(??))
S = 35;

% Depth (?��?��(%m))
depth = [0,20,50,75,100];

% �? Point?�� Depth �? ?��?�� (?��?��(?��))
T1  = [22,21,19,17,15];
T2  = [23,23,20,16.5,14];
T3  = [22.5,22,20.5,17,15];
T4  = [22,21,18.5,16,15];
T5  = [21,21,20,18,14];

% T1,T2...�? 반복문에?�� 차�?�? 뽑아?���? ?��?��?�� 방법?�� 찾아보니 cell ?�� ?��??것이 ?��?��?��.
Tn = {T1,T2,T3,T4,T5};

% �? ?��?���?, ?���? ?��?��?�� ?��?�� ?��?��?�� 만들?���??��.
tempArr = [];
ssp = [];

%% 반복�?

%?��중에 ?���? ?��?��?��?�� ?��줄씩 ?��겨야 ?��기때문에 for loop�?�? k=1 ?�� ?��?���??�� 
k = 1;
for x = Tn
    temp=cell2mat(x); %cell ?��?��?�� 기존?�� ?��?���? �??�� ?�� 줘야?��?��. 

    m = 0;
    while m < length(depth) % depth ?��료�? ?��거나 줄어?�� logic?�� 건들�? ?���? ?��?�� length�? ?��?��?��?��.
        m = m + 1; %Matlab ?��?��?�� 값을 1�??�� ?��기때문에 루프 초입?�� 바로 ?��?���??��. 
        T = temp(m); %배열?��?�� 값들?�� ?��?��?��?��?�� C ?��?��?��?�� ?��?��?�� 맞게 �??��?�� ???��?���??��.
        z = depth(m);
        C = 1499.2 + (4.6*(T)) - (0.055*(T^2)) + (0.00029*(T^3)) + ((1.34 - 0.01*(T))*(S - 35)) + (0.016*(z))
        tempArr = [tempArr, C];% 계산?�� C 값으�? 배열?�� 만든?��.
    end
    ssp(k,:) = tempArr; %while loop ?��?�� 만들?���? 배열?? ?���? ?��?���? ?��줄씩 ?��?���??��.
    tempArr = []; %비워줘야 ?��?�� while문에?�� 계산?�� 것만 ?��줄씩 추�? ?�� ?�� ?��?��.
    k = k +1; % ?��?��줄로 ?��기기 ?��?�� 카운?�� ?���??��. 
end

disp(ssp)
%}