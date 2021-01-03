//
//  PG12905.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/17.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer:Int = 0

    var map = [[Int]](repeating: [Int](repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            map[i + 1][j + 1] = board[i][j]
        }
    }
    
    for i in 1..<map.count {
        for j in 1..<map[0].count {
            if map[i][j] != 0 {
                map[i][j] = min(map[i-1][j], min(map[i][j-1], map[i-1][j-1])) + 1
                if answer < map[i][j] {
                    answer = map[i][j]
                }
            }
        }
    }

    return answer*answer
}
