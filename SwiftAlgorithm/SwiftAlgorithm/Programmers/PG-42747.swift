//
//  PG-42747.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/23.
//

import Foundation

func solution(_ citations:[Int]) -> Int {

    var ans = 0
    
    // 이진탐색으로 가운데 값을 구하여 h 값을 찾아 나간다.
    var leftIndex = 0
    var rightIndex = citations.count

    while true {
        let midIndex = (leftIndex + rightIndex) / 2

        // 최종적으로 left 값과 right 값이 같을 때 를 검사하고 break
        if leftIndex == rightIndex {
            if citations.filter({ return $0 >= midIndex }).count >= midIndex {
                if ans < midIndex {
                    ans = midIndex
                }
            }
            break
        }

        
        // 중간 값이 h 값의 조건에 미치지 못할 땐 right 값을,
        // 조건을 만족할땐 left 값을 움직여 검사
        if citations.filter({ return $0 >= midIndex }).count >= midIndex {
            if ans < midIndex {
                ans = midIndex
            }

            leftIndex = midIndex + 1
        }
        else {
            rightIndex = midIndex
        }
    }

    return ans
}

