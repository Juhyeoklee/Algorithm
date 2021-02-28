//
//  PG-42842.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/01.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let halfBrown = brown / 2 + 1
    var height = 3
    var width = halfBrown - height + 1
    while width >= height {
        let yWidth = width - 2
        let yHeight = height - 2
        
        if yWidth * yHeight == yellow {
            break
        }
        
        height += 1
        width = halfBrown - height + 1
    }
    return [width, height]
}
