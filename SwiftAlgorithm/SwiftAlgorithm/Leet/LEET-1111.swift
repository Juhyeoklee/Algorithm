//
//  LEET-1111.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/02/28.
//

import Foundation

class Solution1111 {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        var arr = seq.compactMap{ return "\($0)"}
        var stack: [Int] = []
        var answer: [Int] = []
        
        while !arr.isEmpty {
            if let first = arr.first {
                if first == "(" {
                    if stack.isEmpty {
                        stack.append(0)
                    }
                    else {
                        stack.append(1 - stack.last!)
                    }
                    answer.append(stack.last!)
                }
                else {
                    answer.append(stack.last!)
                    stack.removeLast()
                }
                arr.removeFirst()
            }
        }
        return answer
    }
}
