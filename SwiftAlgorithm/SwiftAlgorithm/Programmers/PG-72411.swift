//
//  PG-72411.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/02/25.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var combination: [String] = []
    var answer: [String] = []
    var dicArr: [[String:Int]] = [[String:Int]](repeating: [:], count: course.count)
    
    for o in orders {
        combination.append(contentsOf: makeCombination(o))
    }
    
    // 만들어낸 모든 조합을 Dictionary 자료구조를 통해 경우의 수를 체크
    for c in combination.sorted() {
        for i in 0..<course.count {
            if c.count == course[i] {
                if let v = dicArr[i][c] {
                    dicArr[i].updateValue(v + 1, forKey: c)
                }
                else {
                    dicArr[i].updateValue(1, forKey: c)
                }
            }
        }
    }
    
    // 이렇게 생성한 Dictionary 안에서 각course의 제품 개수에 맞게
    for dic in dicArr {
        var maxNum = 0
        var dicAnswer: [String] = []
        for (k,v) in dic {
            if v < 2 {
                continue
            }
            if v > maxNum {
                maxNum = v
                dicAnswer.removeAll()
                dicAnswer.append(k)
            }
            else if v == maxNum {
                dicAnswer.append(k)
            }
        }
        answer.append(contentsOf: dicAnswer)
    }
    return answer.sorted()
}

// 제품의 조합을 만들어 내는 함수
// 이진수를 1씩 늘려가며 1이 존재하는 위치의 문자를 합쳐서 추가한다.
// 1이 1개 있는 경우는 제외
func makeCombination(_ s: String) -> [String] {
    let arr = s.map { return "\($0)" }.sorted()
    var binaryMap = [Int](repeating: 0, count: s.count)
    let max = [Int](repeating: 1, count: s.count)
    var answer: [String] = []
    
    func checkBinaryMap() {
        for i in 0..<binaryMap.count {
            if binaryMap[i] == 2 {
                binaryMap[i] = 0
                binaryMap[i+1] += 1
            }
        }
    }
    while binaryMap != max {
        
        binaryMap[0] += 1
        checkBinaryMap()
        var result = ""
        for (i, num) in binaryMap.enumerated() {
            if num == 1 {
                result += arr[i]
            }
        }
        if result.count > 1 {
            answer.append(result)
        }
    }
    return answer
}
