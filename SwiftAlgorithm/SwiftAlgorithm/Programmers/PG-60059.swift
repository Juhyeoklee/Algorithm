//
//  PG-60059.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/01.
//

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let M = key.count // Key Width
    let N = lock.count // lock Width
    
    var newKey = key
    var bigLock = [[Int]](repeating: [Int](repeating: 0, count: N + 2*(M - 1)), count: N + 2*(M - 1))
    
    for row in 0..<lock.count {
        for col in 0..<lock[0].count {
            bigLock[row + M - 1][col + M - 1] = lock[row][col]
        }
    }
    
    for _ in 0..<4 {
        newKey = turnArr(newKey)
        
        var startRow = 0
        var startCol = 0
        
        while startRow <= bigLock.count - M {
            
            var tmpBigLock = bigLock
            
            for i in 0..<M {
                for j in 0..<M {
                    tmpBigLock[startRow + i][startCol + j] = bigLock[startRow + i][startCol + j] ^ newKey[i][j]
                }
            }
            
            if checkLock(tmpBigLock, M: M, N: N) {
                return true
            }
            
            
            startCol += 1
            
            if startCol > bigLock.count - M {
                startCol = 0
                startRow += 1
            }
        }
    }
    
    return false
}

func turnArr(_ arr: [[Int]]) -> [[Int]] {
    var tmpArr = arr
    for row in 0..<arr.count {
        for col in 0..<arr[0].count {
            tmpArr[col][arr.count - 1 - row] = arr[row][col]
        }
    }
    
    return tmpArr
}

func checkLock(_ bigLock: [[Int]], M: Int, N: Int ) -> Bool {
    for row in (M-1)..<(M-1+N) {
        for col in (M-1)..<(M-1+N) {
            
            if bigLock[row][col] == 0 {
                return false
            }
        }
    }
    return true
}
