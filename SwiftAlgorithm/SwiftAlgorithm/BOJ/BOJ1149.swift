//
//  BOJ1149.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/08.
//

import Foundation

var N = Int(readLine()!)!
var costs: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
var arr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)

for i in 0..<N {
    let prices = readLine()!.components(separatedBy: " ")
    costs[i][0] = Int(prices[0])!
    costs[i][1] = Int(prices[1])!
    costs[i][2] = Int(prices[2])!
}

arr[0][0] = costs[0][0]
arr[0][1] = costs[0][1]
arr[0][2] = costs[0][2]

for i in 1..<N {
    arr[i][0] = min(arr[i-1][1] + costs[i][0], arr[i-1][2] + costs[i][0])
    arr[i][1] = min(arr[i-1][0] + costs[i][1], arr[i-1][2] + costs[i][1])
    arr[i][2] = min(arr[i-1][0] + costs[i][2], arr[i-1][1] + costs[i][2])
}

print(arr[N-1].min()!)
