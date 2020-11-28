//
//  BOJ1629.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/28.
//

import Foundation

var input = readLine()?.components(separatedBy: " ")
var A = UInt64(input![0])!
var B = UInt64(input![1])!
var C = UInt64(input![2])!

func answer(x: UInt64, n: UInt64) -> UInt64 {
    if n == 0 { return 1 }
    
    if n == 1 { return x % C }
    
    if n % 2 == 1 { return ((x % C) * (answer(x: x, n: n-1) % C)) % C }
    
    var half: UInt64 = answer(x: x, n: n/2) % C
    
    return (half * half) % C
}

print(
answer(x: A, n: B)
)
