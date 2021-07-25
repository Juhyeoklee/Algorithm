//
//  PG-81301.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/18.
//

import Foundation

func solution_PG81301(_ s:String) -> Int {
    var check: String = ""
    var answer: String = ""
    s.forEach {
        check += "\($0)"
        if $0.isNumber {
            answer += "\($0)"
            check = ""
            return
        }
        if let result = findNum_PG81301(check) {
            check = ""
            answer += result
        }
    }
    return Int(answer)!
}

func findNum_PG81301(_ s: String) -> String? {
    var answer: [String: String] =
    [
        "zero": "0",
        "one" : "1",
        "two" : "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9",
    ]
    return answer[s]
}
