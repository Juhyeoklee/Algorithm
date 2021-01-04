//
//  BOJ-1476.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/04.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ return Int($0)! }

func solution(_ arr: [Int]) -> Int {
//    1 ≤ E ≤ 15, 1 ≤ S ≤ 28, 1 ≤ M ≤ 19
    var e: Int = 0
    var s: Int = 0
    var m: Int = 0
    var count: Int = 0
    // 하나씩 늘려가며 비교해보기
    while [e,s,m] != arr {
        e += 1
        s += 1
        m += 1
        count += 1
        if e > 15 {
            e = 1
        }
        if s > 28 {
            s = 1
        }
        if m > 19 {
            m = 1
        }
    }
    
    return count
}

//print(solution(input))
