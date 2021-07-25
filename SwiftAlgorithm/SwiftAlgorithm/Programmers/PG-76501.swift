//
//  PG-76501.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/09.
//

import Foundation

func solutionPG76501(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return absolutes.enumerated().map { signs[$0] ? $1 : -$1 }.reduce(0, +)
}
