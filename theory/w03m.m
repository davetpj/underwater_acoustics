ischar(A)
isempty(A)
isinf(A)
isnan(A) 
find(x)

A=[ 8 0 -2; 0 3 0; -4 0 9];
[m, n, v] = find(A > 3)

n = input('홀수, 짝수를 판별할 숫자를 입력하시오 : ');
if rem(n, 2) == 0
fprintf('%d는(은) 짝수입니다.\n', n);
else
fprintf('%d는(은) 홀수입니다.\n', n);
end

n = input('소포의 개수를 입력하시오 : ');
type = input('소포의 배달 종류를 선택하시오(등기=1, 보통=0) :');
if type
charge=4000*n;
else
charge=2700*n;
end
fprintf('총 배달 요금은 %d입니다.\n', charge);

for k=1: 3: 10
    x = k^2
    end

for k=1:3:10, x=k^2, end





while 1
    n = input('반복 회수를 입력하시오( < 100) : ');
    if n <= 0
    fprintf('\n'), break;
    end
    fprintf('---------------------\n'), fprintf('번호 = ')
    for i =1 : n
    fprintf( '%2d' , i)
    if i < n, pause(0.6), fprintf('\b\b'), end
    end
    fprintf('\n%d번 반복하였습니다.\n', n)
    fprintf('---------------------\n\n')
    end