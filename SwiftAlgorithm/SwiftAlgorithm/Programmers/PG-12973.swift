//
//  PG-12973.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/02.
//

import Foundation

// 짝지어 제거하기
// 괄호연산을 체크하는 것과 같이 생각

func solution(_ s:String) -> Int {
    var stack: [String] = []
    // 스택을 만들고 문자를 하나씩 스택에 담는다.
    for c in s {
        
        if let last = stack.last {
            // stack의 top과 넣으려는 문자가 같다면
            // stack을 pop
            if last == "\(c)" {
                stack.removeLast()
            }
            // 다르다면
            // stack에 문자열을 push
            else {
                stack.append("\(c)")
            }
        }
        else {
            stack.append("\(c)")
        }
    }

    // stack 안에 남아있는 게 없으면 올바른 짝이 이루어 진것
    return stack.count == 0 ? 1 : 0
}
