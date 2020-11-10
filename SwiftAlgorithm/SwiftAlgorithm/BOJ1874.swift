//
//  BOJ1874.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/10.
//

import Foundation


var N = Int(readLine()!)!
var per: [Int] = []
var findNum = N
var stack: [Int] = []
var answer: [String] = []
var flag:Bool = true
for _ in 0..<N {
    let num = Int(readLine()!)!
    per.append(num)
}

while !(per.isEmpty && stack.isEmpty) {
    var tmp = 0
    
    if let perLast = per.last {
        if perLast == findNum {
            answer.append("-")
            answer.append("+")
            findNum -= 1
            per.removeLast()
        }
        else {
            tmp = perLast
        }
        
    }
    
    if let stackLast = stack.last {
        if stackLast == findNum {
            answer.append("+")
            stack.removeLast()
            findNum -= 1
        }
        else {
            if tmp > 0 {
                stack.append(tmp)
                per.removeLast()
                answer.append("-")
            }
        }
    }
    else {
        if tmp > 0 {
            stack.append(tmp)
            per.removeLast()
            answer.append("-")
        }
    }
    
    if let stackLast = stack.last {
        if stackLast != findNum && per.isEmpty {
            flag = false
            break
        }
    }
}

if flag {
    for a in answer.reversed() {
        print(a)
    }
}
else {
    print("NO")
}


