//
//  LEET-1773.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/01.
//

import Foundation

extension Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        var count = 0
        var idx = 0
        
        if ruleKey == "type" {
            idx = 0
        }
        else if ruleKey == "color" {
            idx = 1
        }
        else {
            idx = 2
        }
        
        for item in items {
            if item[idx] == ruleValue {
                count += 1
            }
        }
        return count
    }
}
