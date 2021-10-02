//
//  TOSS-01.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/14.
//

import Foundation

func solution(_ stepCounts:[Int]) -> Int {
    var rewardsCount = 0
    let walkPoint = stepCounts.enumerated().reduce(0) {
        var weekRewardPoint = 0
        let dayWalkPoint = $1.element >= 10_000 ? 10_000 : $1.element
        
        if $1.element >= 10_000 {
            rewardsCount += 1
        }
        
        if ($1.offset + 1) % 7 == 0 || $1.offset + 1 == stepCounts.count {
            weekRewardPoint = getWeekReward(count: rewardsCount)
            rewardsCount = 0
        }
        return $0 + dayWalkPoint + weekRewardPoint
    }
    
    
    return walkPoint
}

func getWeekReward(count: Int) -> Int {
    return (0...count).reduce(0) {
        if $1 == 1 || $1 == 3 || $1 == 5 {
            return $0 + 10_000
        }
        return $0
    }
}
