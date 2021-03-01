//
//  LEET-1431.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/02.
//

import Foundation

extension Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max()!
        return candies.map{
            if $0 + extraCandies < max {
                return false
            }
            else {
                return true
            }
        }
    }
}
