//
//  BOJ2502.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/29.
//

import Foundation

// 2502

var input = readLine()?.components(separatedBy: " ").compactMap { return Int($0)! }
let D = input![0]
let K = input![1]
var memo:[Int] = [Int](repeating: 0, count: input![0] + 1)
var start = K / 2 + 1
memo[1] = K

while memo[D] <= 0 {
    memo[2] = start
    
    for i in 3...D {
        memo[i] = memo[i - 2] - memo[i - 1]
        if memo[i] <= 0 {
            break
        }
    }
    start += 1
}

print(memo[D], memo[D-1], separator: "\n")
