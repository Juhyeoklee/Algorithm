//
//  LEET-162.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/17.
//

import Foundation

extension Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        
        var leftPoint = 0
        var rightPoint = nums.count - 1
        
        while leftPoint < rightPoint {
            let mid = (leftPoint + rightPoint) / 2
            if nums[mid] < nums[mid + 1] {
                leftPoint = mid + 1
            }
            else {
                rightPoint = mid
            }
        }
        
        return leftPoint
    }
}
