//
//  BOJ-9663.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/02/25.
//

let N = Int(readLine()!)!
var map: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var colCheck: [Bool] = [Bool](repeating: false, count: N)
var leftDigCheck: [Bool] = [Bool](repeating: false, count: N+N)
var rightDigCheck: [Bool] = [Bool](repeating: false, count: N+N)

var ans = 0

func check(row: Int) {
    if row == N {
        ans += 1
        return
    }
    
    for col in 0..<N {
        
        if !colCheck[col] &&
            !leftDigCheck[row+col] &&
            !rightDigCheck[row-col+N-1] {
            colCheck[col] = true
            leftDigCheck[row+col] = true
            rightDigCheck[row-col+N-1] = true
            
            check(row: row+1)
            colCheck[col] = false
            leftDigCheck[row+col] = false
            rightDigCheck[row-col+N-1] = false
        }
    }
}

check(row: 0)
print(ans)
