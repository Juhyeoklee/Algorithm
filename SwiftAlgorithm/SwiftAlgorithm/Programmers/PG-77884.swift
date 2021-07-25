//
//  PG-77884.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/25.
//

import Foundation

func solution_PG77884(_ left:Int, _ right:Int) -> Int {
    return (left...right).reduce(0) { partialResult, num in
        let sign = checkNum_PG77884(num) ? 1 : -1
        return partialResult + num * sign
    }
}

func checkNum_PG77884(_ num: Int) -> Bool {
    var i = 0
    
    while i * i <= num {
        if i * i == num {
            return false
        }
        i += 1
    }
    
    return true
}
