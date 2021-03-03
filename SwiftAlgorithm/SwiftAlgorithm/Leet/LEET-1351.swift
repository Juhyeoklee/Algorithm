//
//  LEET-1351.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/03.
//

import Foundation


extension Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        
        var answer: Int = 0
        
        for rGrid in grid {
            for num in rGrid {
                if num < 0 {
                    answer += 1
                }
            }
        }
        return answer
        
//        return grid.map{ $0.filter{ return $0 < 0 }.count }.reduce(0, +)
    }
}
