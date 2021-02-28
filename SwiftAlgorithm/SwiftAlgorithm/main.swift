//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/04.
//


import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // height > 2
    // width >= height
    
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
//    print(width,height)
    return [width, height]
}

solution(10, 2)
solution(8, 1)
solution(24, 24)
