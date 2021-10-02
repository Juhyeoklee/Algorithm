//
//  PG-76502.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/08.
//

import Foundation

func solution_PG76502(_ s:String) -> Int {
    var arr = s.map { "\($0)" }
    var result = 0
    for _ in 0..<s.count {
        checkValid_PG76502(arr) ? result += 1 : ()
        arr.append(arr.removeFirst())
    }
    return result
}

func checkValid_PG76502(_ arr: [String]) -> Bool {
    var stack: [String] = []
    
    for s in arr {
        
        switch s {
        case "(", "{", "[":
            stack.append(s)
        case ")", "}", "]":
            guard let top = stack.last else {
                return false
            }
            if equalPair_PG76502(top, s) {
                stack.removeLast()
                continue
            }
            
            return false
        default:
            break
        }
    }
    return stack.count == 0
}

func equalPair_PG76502(_ lhs: String, _ rhs: String) -> Bool {
    switch lhs {
    case "(":
        return rhs == ")"
    case "{":
        return rhs == "}"
    case "[":
        return rhs == "]"
    default:
        return false
    }
}
