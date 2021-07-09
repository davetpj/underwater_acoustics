clc;
clear all;
close all;
%//Basic commands %

%{
//demo
    기본적인 Sample 들을 찾아보거나 예제 파일들을 찾을때

//clc
    Matlab Command Prompt를 지움.

//clear all
    명령창은 그대로 있으나 load된 모든 자료 값들을 비움

//close all
    figure창에 작성된 그래프를 닫음

//exit
    Matlab 프로그램 종료

//hold on, hold off
    figure안에 다른 그래프를 추가 제거

//Help, doc
    함수 사용법을 알기를 원할 때 (ex) help cos

//Ctrl + c
    Matlab 연산 강제 종료

//who
    현재 Matlab에 load된 변수를 나타내어 준다

//whos
    현재 Matlab에 load된 변수 및 크기를 나타내어 준다.

//size
    해당 변수의 크기를 나타내어 준다.

// ;
    계산결과 표시 억제

// , 
    한줄에 여러 명령어를 입력하면서 계산결과 표시

// % 
    주석처리
%}

%{
//산술연산기호
    + - * / \ ^
//산술연산 우선 순위
    () >> ^ >> *,/,\ >> +,- 
%}

% 간단 예시

Ex1 = 4*50+3*100+10^2-400/2
% ans = 400
Ex2 = 2^5/(2^5-1)
% ans = 1.0323
Ex3 = 2*(sqrt(5)-1)/(sqrt(5)+1)^2-1
% ans = -0.7639

%//Built-in function
% sqrt(x) 인자값의 제곱근을 구함
% 인자로는 수, 변수, 수식, 함수등을 넣을 수 있다.

% 간단 예시 

Ex4 = sqrt(54+9*sqrt(100))
% ans = 12

%이 외에도 다양한 Built-in function 존재

%% + break point 를 사용하여 디버깅, 오류 추적