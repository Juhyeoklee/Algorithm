//
//  LEET-1108.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/01.
//

import Foundation

extension Solution {
    func defangIPaddr(_ address: String) -> String {
        var tmpArr = address.split(separator: ".")
        
        return String(tmpArr[1..<tmpArr.count].reduce(tmpArr[0], {
            return $0 + "[.]" + $1
        }))
    }
}
