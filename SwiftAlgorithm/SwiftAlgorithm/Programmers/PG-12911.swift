//
//  PG-12911.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/02/25.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var tmp = n + 1
    let nArr = makeBinary(num: n)
    
    while nArr.filter({ return $0 == 1}).count != makeBinary(num: tmp).filter({ return $0 == 1}).count {
        
        tmp += 1
    }
    print(tmp)
    return tmp
}

func makeBinary(num: Int) -> [Int] {
    var tmp = num
    var answer: [Int] = []
    while tmp != 0 {
        answer.append(tmp % 2)
        tmp = tmp / 2
    }
    
    return answer.reversed()
}
