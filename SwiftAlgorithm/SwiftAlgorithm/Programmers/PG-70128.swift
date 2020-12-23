//
//  PG-70128.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/23.
//

import Foundation


func solution(_ a:[Int], _ b:[Int]) -> Int {
    var count = 0
    
    // zip : 두 개의 시퀀스형 자료형을 튜플처럼 묶어주는 내장함수
    for (i, j) in zip(a, b) {
        count += (i * j)
    }
    return count
}
