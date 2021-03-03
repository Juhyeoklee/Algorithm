//
//  LEET-1337.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/03.
//

import Foundation

extension Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        
        
        return zip((0..<mat.count).map{ return $0 }, mat.map{ $0.filter{ return $0 == 1 }.count }).sorted { (t1, t2) -> Bool in
            if t1.1 == t2.1 {
                return t1.0 < t2.0
            }
            
            return t1.1 < t2.1
        }.map{ return $0.0 }[0..<k].map{ return $0 }
    }
}
