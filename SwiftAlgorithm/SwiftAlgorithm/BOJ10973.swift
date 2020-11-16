//
//  BOJ10973.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/16.
//

import Foundation

var N = Int(readLine()!)!

var per = readLine()!.components(separatedBy: " ").compactMap{ return Int($0)! }

var i = 0
var j = 0

func getI() {
    for k in 1..<N {
        if per[k] < per[k-1] {
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
        if per[k] < per[i-1] {
            if j < k {
                j = k
            }
        }
    }
}

func getNextPer() {
    if i == 0 {
        print(-1)
        return
    }
    per.swapAt(i-1, j)
    per.append(contentsOf: per.suffix(from: i).reversed())
    per.removeSubrange(i..<N)

    for n in per {
        print(n, terminator: " ")
    }
    print()
}

getI()
getJ()
getNextPer()
