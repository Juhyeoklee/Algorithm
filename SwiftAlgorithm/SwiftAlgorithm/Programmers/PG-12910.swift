//
//  PG-12910.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/22.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let answer = arr.filter{ return $0 % divisor == 0 }.sorted()
    return answer.count > 0 ? answer : [-1]
}
