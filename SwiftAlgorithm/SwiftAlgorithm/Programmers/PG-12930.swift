//
//  PG-12930.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/08.
//

import Foundation

extension Character {
    fileprivate var isAlphabet: Bool {
        let asciiValue = self.asciiValue ?? 0
        return (asciiValue >= 97 && asciiValue <= 122) || (asciiValue >= 65 && asciiValue <= 122)
    }
}

func solution_12930(_ s:String) -> String {
    var offset = 0
    return s.map { c -> String in
        if c.isWhitespace {
            offset = 0
            return " "
        }
        
        if !c.isAlphabet {
            return "\(c)"
        }
        let answer = offset % 2 == 0 ? "\(c)".uppercased() : "\(c)".lowercased()
        offset += 1
        
        return answer
    }.reduce("", +)
}
