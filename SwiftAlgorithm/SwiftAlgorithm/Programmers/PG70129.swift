//
//  PG70129.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/26.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var tmp = s
    var zero = 0
    var count = 0
    while tmp != "1" {
        var n = tmp.filter { return $0 != "0" }.count
        zero += (tmp.count - n)
        count += 1
        tmp = makeBinaryNum(n)
        
    }
    return [count, zero]
}

func makeBinaryNum(_ n: Int) -> String {
    var answer = ""
    var tmp = n
    
    while tmp > 0  {
        answer = "\(tmp % 2)" + answer
        tmp = tmp / 2
    }
    
    return answer
}
