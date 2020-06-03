# Algorithm

getline(cin, s); : 문자열 한줄 전체 입력 받는 함수  
cin.eof() : End of File

s[i] >= 97 && s[i] <= 122 알파벳 소문자  
s[i] >= 65 && s[i] <= 90 알파벳 대문자

char 형의 경우 128을 넘어갈 때 overflow가 발생함

str1.compare(str2)

- str1이 str2보다 사전적으로 앞서 있으면 0보다 작고
- str1과 str2이 같을 경우 0
- str1이 str2보다 사전적으로 뒤에 있으면 0보다 크다

최대 공약수(GCD)

- a를 b로 나눈 나머지를 r이라고 했을 때
- GCD(a, b) = GCD(b, r)
- r이 0 이면 그 때 b가 최대 공약수이다.
- GCD(24, 16) = GCD(16, 8) = GCD(8, 0) = 8

최소 공배수(LCM)

- 최소공배수는 GCD를 응용해서 구할 수 있다.
- a, b의 최대 공약수를 g라고 했을 때
- 최소공배수 l = g \* (a/g) \* (b/g)
