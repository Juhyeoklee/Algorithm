//
//  PG-86051.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/10/02.
//

import Foundation


func solutionPG86051(_ numbers:[Int]) -> Int {
    return (0...9).reduce(0) {
        numbers.contains($1) ? $0 : $0 + $1
    }
}
