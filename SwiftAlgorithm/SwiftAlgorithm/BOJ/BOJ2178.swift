//
//  BOJ2178.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/07.
//

import Foundation

struct CurPosition{
    var row: Int
    var col: Int
    var length: Int
}

func bfs(start: CurPosition) {
    var queue: [CurPosition] = [start]
    var answer = Int.max
    check[start.row][start.col] = true
    
    while !queue.isEmpty {
        if let first = queue.first {
            for des in getAllDirectionArr(pos: first) {
                if isValidRoute(des: des) {
                    if des.col == M - 1 && des.row == N - 1 {
                        if answer > des.length {
                            answer = des.length
                        }
                    }
                    else {
                        check[des.row][des.col] = true
                        queue.append(des)
                    }
                    
                }
            }
        }
        queue.removeFirst()
    }
    print(answer + 1)
}

func getAllDirectionArr(pos: CurPosition) -> [CurPosition] {
    var tmp = [CurPosition](repeating: pos, count: 4)
    tmp[0].col -= 1
    tmp[1].col += 1
    tmp[2].row -= 1
    tmp[3].row += 1
    
    for i in 0..<4 {
        tmp[i].length += 1
    }
    
    return tmp
}

func isValidRoute(des: CurPosition) -> Bool {
    return (des.col >= 0 && des.col < M) &&
        (des.row >= 0 && des.row < N) &&
        !check[des.row][des.col] &&
        map[des.row][des.col] == "1"
}

var sizes = readLine()?.components(separatedBy: " ")

var N = Int(sizes![0])!
var M = Int(sizes![1])!

var map: [[String]] = [[String]](repeating: [String](repeating: "0", count: M), count: N)
var check: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

for i in 0..<N {
    var lines = readLine()
    for (idx,l) in lines!.enumerated() {
        map[i][idx] = "\(l)"
    }
}

bfs(start: CurPosition(row: 0, col: 0, length: 0))
