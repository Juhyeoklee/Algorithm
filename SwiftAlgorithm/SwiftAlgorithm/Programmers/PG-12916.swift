//
//  PG-12916.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/22.
//

import Foundation

func solution(_ s:String) -> Bool {
    var tmp = s.lowercased()
    
    return tmp.filter{ return $0 == "p" }.count ==
        tmp.filter{ return $0 == "y" }.count
}
