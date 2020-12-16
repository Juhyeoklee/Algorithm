//
//  PG-42840.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/16.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    // 세 학생의 찍기 패턴
    let one = [1, 2, 3, 4, 5]
    let two = [2, 1, 2, 3, 2, 4, 2, 5]
    let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    // 정답 수를 계산할 튜플 배열
    var ans: [(Int, Int)] = [(1, 0), (2, 0), (3, 0)]
    
    // 정답지를 통해 정답 수 체크
    // mod 연산 이용
    for (i, a) in answers.enumerated() {
        
        if one[i % 5] == a {
            ans[0].1 += 1
        }
        
        if two[i % 8] == a {
            ans[1].1 += 1
        }
        
        if three[i % 10] == a {
            ans[2].1 += 1
        }
    }
    return ans.filter { return $0.1 == ans.max(by: { return $0.1 < $1.1 })!.1 }
        .compactMap{ return $0.0 }
        .sorted()
}
