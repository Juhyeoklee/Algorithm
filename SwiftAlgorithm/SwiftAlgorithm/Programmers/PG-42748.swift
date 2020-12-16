//
//  PG-42748.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/16.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    // map을 활용해 조금 더 깔끔한 풀이
    return commands.compactMap {
        // Sub Array 구해서 정렬한다음 k 번째 수를 구한다.
        return array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1]
    }
}
