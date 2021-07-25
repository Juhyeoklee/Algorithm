//
//  PG-12948.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/18.
//

func solutionPG12948(_ phone_number:String) -> String {
    
    return phone_number.enumerated().map { (i, c) -> String in
        if i < phone_number.count - 4 {
            return "*"
        }
        return "\(c)"
    }.reduce("", +)
}
