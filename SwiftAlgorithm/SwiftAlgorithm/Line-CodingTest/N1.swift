//
//  N1.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/20.
//

import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var newTable: [[String]] = [[String]](repeating: [], count: 5)
    let jobs: [String] = ["SI", "CONTENTS", "HARDWARE", "PORTAL", "GAME"]
    var scores: [Int] = [0,0,0,0,0]
    for (i, t) in table.enumerated() {
        let newT = t.split(separator: " ").map{ return "\($0)" }

        for j in (1..<newT.count).reversed() {
            newTable[i].append(newT[j])
        }
    }
    for (i, l) in languages.enumerated() {
        for (j, nt) in newTable.enumerated() {
            for (k, lng) in nt.enumerated() {
                if lng == l {
                    let score = preference[i] * (k + 1)
                    scores[j] += score
                    
                }
            }
        }
    }
    
    
    let answers = zip(jobs, scores).map { return ($0, $1) }
    return answers.sorted { (t1, t2) -> Bool in
        if t1.1 == t2.1 {
            return t1.0 < t2.0
        }
        
        return t1.1 < t2.1
    }.last!.0
}


//print(
//solution(["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"], ["PYTHON", "C++", "SQL"], [7, 5, 5])
//)
