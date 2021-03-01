//
//  LEET-1025.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/02.
//

import Foundation


extension Solution {
    func divisorGame(_ N: Int) -> Bool {
        var check: [Bool] = [Bool](repeating: false, count: N + 1)
        check[0] = false
        check[1] = false
        
        for i in 2..<check.count {
            for j in 1..<i {
                if i % j == 0 {
                    if !check[i-j] {
                        check[i] = true
                        break
                    }
                }
            }
        }
        
        return check[N]
    }
}
