//
//  소수판별.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/19.
//

let input = Int(readLine()!)!

var num = 2
var answer = true
// 소수를 판별하기 위해서는 루트 n 까지 나누어 떨어지는 지 검사
while num*num < input {
    
    if input % num == 0 {
        answer = false
        break
    }
    num += 1
}

if answer {
    print("True")
}
else {
    print("False")
}
