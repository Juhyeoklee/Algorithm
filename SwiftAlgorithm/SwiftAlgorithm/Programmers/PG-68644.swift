//
//  PG-68644.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/16.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    // 정답을 저장할 Set 자료형
    var a: Set<Int> = []
    
    // 중복을 제외한 수의 조합을 구한다.
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            // 조합한 두 수를 Set 자료형 s
            a.insert(numbers[i] + numbers[j])
        }
    }
    
    // Set 를 다시 배열로 바꿔준다.
    return a.map { return $0 }.sorted()
}
