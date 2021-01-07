//
//  PG-12947.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/07.
//

import Foundation

 
func solution(_ x:Int) -> Bool {

    // 각 자리수를 Int형으로 변환한 뒤 reduce메소드를 호축
    return x % "\(x)".map{ return Int("\($0)")! }.reduce(0, +) == 0
}
