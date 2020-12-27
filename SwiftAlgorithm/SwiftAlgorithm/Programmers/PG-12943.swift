//
//  PG-12943.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/28.
//

import Foundation

func solution(_ num:Int) -> Int {
    var tmp = num
    var count = 0
    
    while count < 500 {
        
        if tmp == 1 {
            break
        }
        
        if tmp % 2 == 0 {
            tmp /= 2
        }
        else {
            tmp = tmp * 3 + 1
        }
        
        count += 1
    }
    return count < 500 ? count : -1
}
