//
//  PG-12982.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/23.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var b = budget
    var count = 0
    // d 를 정렬하여 작은 것부터 예산을 지원
    for n in d.sorted() {
        if b - n < 0 {
            break
        }
        
        b -= n
        count += 1
    }
    return count
}
