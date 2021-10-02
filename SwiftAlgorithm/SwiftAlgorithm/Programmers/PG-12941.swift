//
//  PG-12941.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/08.
//

import Foundation

func solution_12941(_ A:[Int], _ B:[Int]) -> Int{
    
    let sA = A.sorted()
    let sB = B.sorted(by: >)
    

    return zip(sA, sB).reduce(0) { partialResult, zip in
        partialResult + zip.0 * zip.1
    }
}
