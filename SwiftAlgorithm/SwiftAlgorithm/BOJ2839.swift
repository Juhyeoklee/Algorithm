//
//  BOJ2839.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/19.
//

import Foundation


var N: Int = Int(readLine()!)!


func solution(_ n: Int) -> Int {
    var memo: [Int] = [Int](repeating: -1, count: n + 1)
    
    memo[0] = 0
    memo[3] = 1
    if n >= 5 {
        memo[5] = 1
    }
    
    func dp(n: Int) -> Int {
        
        if n < 0 {
            return -1
        }
        
        if memo[n] > 0 {
            return memo[n]
        }
        
        var a1 = dp(n: n-3)
        var a2 = dp(n: n-5)
        
        if a1 >= 0 && a2 >= 0 {
            memo[n] = min(a1, a2) + 1
        }
        else if a1 >= 0 && a2 < 0 {
                memo[n] = a1 + 1
        }
        else if a1 < 0 && a2 >= 0 {
            memo[n] = a2 + 1
        }
        else {
            memo[n] = -1
        }
        
        return memo[n]
    }
    
    return dp(n: n)
}
