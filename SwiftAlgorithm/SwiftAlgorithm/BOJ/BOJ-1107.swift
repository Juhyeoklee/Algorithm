//
//  BOJ-1107.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/10.
//

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var check = [Bool](repeating: false, count: 10)
if M > 0 {
    readLine()!.split(separator: " ").map{ return Int($0)! }.forEach {
        check[$0] = true
    }

}

func solution() {
    var least = abs(N - 100)
    for channel in 0...1_000_000 {
        
        let tmp = "\(channel)".map { return Int("\($0)")! }
        var isSelect = true
        
        for num in tmp {
            if check[num] {
                isSelect = false
                break
            }
        }
        
        if isSelect {
            let moveCount = abs(N - channel) + "\(channel)".count
            
            if least > moveCount {
                least = moveCount
            }
        }
    }
    
    print(least)
}

solution()
