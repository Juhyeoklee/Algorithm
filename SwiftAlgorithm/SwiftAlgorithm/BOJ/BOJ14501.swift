//
//  BOJ14501.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/27.
//

import Foundation

var N = Int(readLine()!)!
var days = [Int](repeating: 0, count: N + 1)
var fees = [Int](repeating: 0, count: N + 1)
var memo = [Int](repeating: -1, count: N + 1)

var day = 0

for i in 1...N {
    var tmp = readLine()!.components(separatedBy: " ")
    
    days[i] = Int(tmp[0])!
    fees[i] = Int(tmp[1])!
}



for i in 1...N {
    if (i + days[i] - 1) <= N {
        var max = 0
        for j in 1..<i {
            if max < memo[j] {
                max = memo[j]
            }
        }
        if memo[i + days[i] - 1] < 0 {

            memo[i + days[i] - 1] = max + fees[i]
            
        }
        else {
            var tmp = max + fees[i]

            if memo[i + days[i] - 1] < tmp {
                memo[i + days[i] - 1] = tmp
            }
        }
    }
}
if memo.max()! > 0 {
    print(memo.max()!)
}
else {
    print(0)
}
