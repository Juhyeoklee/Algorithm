//
//  BOJ10974.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/25.
//

import Foundation

var N = Int(readLine()!)!

var per = [Int](1...N)
for n in per {
    print(n, terminator: " ")
}
print()
var i = 0
var j = 0

while true {
    i = 0
    j = 0
    getI()
    getJ()
    if !getNextPer() {
        break
    }
}

func getI() {
    for k in 1..<N {
        if per[k] > per[k-1] {
            if i < k {
                i = k
            }
        }
    }
}
func getJ() {
    if i == 0 {
        return
    }
    for k in i..<N {
        if per[k] > per[i-1] {
            if j < k {
                j = k
            }
        }
    }
}
//
func getNextPer() -> Bool {
    if i == 0 {
        return false
    }
    per.swapAt(i-1, j)
    per.append(contentsOf: per.suffix(from: i).reversed())
    per.removeSubrange(i..<N)

    for n in per {
        print(n, terminator: " ")
    }
    print()
    return true
}
