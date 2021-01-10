//
//  BOJ-9095.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/11.
//

// dp 문제
var T = Int(readLine()!)!
var answer: [Int] = []

while T != 0 {
    let n = Int(readLine()!)!

    var memo: [Int] = [Int](repeating: -1, count: n + 1)
    memo[0] = 1
    memo[1] = 1
    if n > 1 {
        memo[2] = 2
    }
    
    func dp(_ num: Int) -> Int {
        // n을 만들기 위해 n-1, n-2, n-3을 만드는 경우의 수를 더하여 구한다.
        if memo[num] >= 0 {
            return memo[num]
        }

        memo[num] = dp(num - 1) + dp(num - 2) + dp(num - 3)

        return memo[num]
    }
    
    print(dp(n))
    T -= 1
}
