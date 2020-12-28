//
//  PG-43238.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/29.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let tmp = times.sorted()
    // 이진탐색
    var min: Int64 = 1
    // 입국 심사에 걸리는 최대시간을 구한다음
    var max: Int64 = Int64(tmp[tmp.count-1] * n)
    var answer: Int64 = Int64.max
    
    while min <= max {
        let mid = (min + max) / 2
        var sum: Int64 = 0
        
        // 중간값으로 했을 때 한 입국심사관당 담당할 수 있는 인원을 구하여
        for t in tmp {
            sum += (mid / Int64(t))
        }
        
        // 이진 탐색을 한다.
        if sum >= n {
            
            if answer > mid {
                answer = mid
            }
            max = mid - 1
        }
        else {
            min = mid + 1
        }
        
    }
    
    return answer
}
