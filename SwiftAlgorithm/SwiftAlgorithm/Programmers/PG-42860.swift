//
//  PG-42860.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/21.
//

import Foundation

func solution(_ name:String) -> Int {
    
    let answer = name.utf16.compactMap { (s) -> Int in

        return min(abs(65 - Int(s)), abs(91 - Int(s)))
    }
    print(answer)
    if answer.allSatisfy({ (n) -> Bool in return n == 0 }) {
        return 0
    }
    
    if answer[1] == 0 {
        var i = 0
        for index in 1..<answer.count {
            if answer[index] == 0 {
                i = index
            }
            else {
                break
            }
        }
    
        return answer[0] + answer[(i+1)..<answer.count].reduce(0, +) + answer.count - i - 1
    }
    
    var i = answer.count - 1
    
    for index in stride(from: answer.count - 1, to: 0, by: -1) {
        if answer[index] == 0 {
            i = index
        }
        else {
            i = index
            break
        }
    }
    
    return answer[0...i].reduce(0, +) + i
    
}


print(
    print(solution("BBBAAAB"))
//    solution("JEROEN")
//    solution("ZZZAAA")
//    solution("JAN")
//    solution("AAAZZZ")
)
