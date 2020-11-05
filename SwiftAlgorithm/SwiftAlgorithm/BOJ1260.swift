//
//  BOJ1260.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/05.
//

import Foundation

func dfs(start: Int) {
    print(start, terminator: " ")
    check[start] = true
    
    for des in map[start] {
        if !check[des] {
            dfs(start: des)
        }
    }
}

func bfs(start: Int) {
    var queue: [Int] = []
    queue.append(start)
    check[start] = true
    
    while !queue.isEmpty {
        if let first = queue.first {
            print(first, terminator: " ")

            for des in map[first] {
                if !check[des] {
                    queue.append(des)
                    check[des] = true
                }
            }
        }
        queue.removeFirst()
    }
    print()
}


var N: Int = 0
var M: Int = 0
var V: Int = 0
var check: [Bool] = []
var map: [[Int]] = []

var oper = readLine()?.components(separatedBy: " ")
N = Int(oper![0])!
M = Int(oper![1])!
V = Int(oper![2])!

map = [[Int]](repeating: [], count: N + 1)
check = [Bool](repeating: false, count: N + 1)

while M != 0 {
    let str = readLine()?.components(separatedBy: " ")
    let start = Int(str![0])!
    let des = Int(str![1])!
    
    map[start].append(des)
    map[des].append(start)
    
    M -= 1
}
map = map.compactMap{ return $0.sorted() }

dfs(start: V)
check = [Bool](repeating: false, count: N + 1)
print()
bfs(start: V)
