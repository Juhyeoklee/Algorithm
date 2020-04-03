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
