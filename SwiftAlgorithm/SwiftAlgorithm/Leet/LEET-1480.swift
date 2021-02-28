//
//  LEET-1480.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/01.
//

import Foundation

extension Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var answer: [Int] = []
        for i in 0..<nums.count {
            answer.append(nums[0...i].reduce(0, +))
        }
        
        return answer
    }
}
