//
//  PG-12909.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/26.
//

import Foundation

func solution(_ s:String) -> Bool {
    // count가 음수가 되면 올바르지 못한 괄호
    var count = 0
    for c in s {
        if c == "(" {
            count += 1
        }
        else {
            count -= 1
        }
        
        if count < 0 {
            break
        }
    }
    
    
    return count == 0
}
