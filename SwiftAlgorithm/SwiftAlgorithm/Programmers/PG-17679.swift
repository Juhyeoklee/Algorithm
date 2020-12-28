//
//  PG-17679.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/28.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    // 주어진 문자 배열을 이차원 배열로 바꾼다.
    var tmpBoard = convertArr(board)
    var checkBoard: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var count = 0
    
    // 배열을 스캔
    func scanArr(_ row: Int, _ col: Int) -> Bool {
        let first = tmpBoard[row][col]
        let second = tmpBoard[row + 1][col]
        let third = tmpBoard[row][col + 1]
        let fourth = tmpBoard[row + 1][col + 1]
        
        if first.count != 0, first == second, third == fourth, first == third {
            return true
        }
        
        return false
    }
    
    
    while true {
        var isAllCheck = true
        for row in 0...(n-2) {
            for col in 0...(m-2) {
                if scanArr(row, col) {
                    // 조건에 맞을 시 해당 인덱스 체크
                    checkBoard[row][col] = true
                    checkBoard[row + 1][col] = true
                    checkBoard[row][col + 1] = true
                    checkBoard[row + 1][col + 1] = true
                    isAllCheck = false
                }
            }
        }
        // 체크된 인덱스의 문자열을 지움
        for row in (0..<n).reversed() {
            for col in (0..<m).reversed() {
                if checkBoard[row][col] {
                    tmpBoard[row].remove(at: col)
                    tmpBoard[row].append("")
                    count += 1
                }
            }
        }
        // 이후 다시 체크하는 배열을 초기화
        checkBoard = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        
        if isAllCheck {
            break
        }
    }
    
    return count
}

func convertArr(_ arr: [String]) -> [[String]] {
    
    var rst: [[String]] = [[String]](repeating: [String](), count: arr[0].count)
    
    for str in arr.reversed() {
        for (i, c) in str.enumerated() {
            rst[i].append("\(c)")
        }
    }
    
    return rst
}
