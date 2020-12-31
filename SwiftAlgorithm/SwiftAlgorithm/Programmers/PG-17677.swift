//
//  PG-17677.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/01.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    // 두개씩 짜르는 역활
    let arr1 = (0..<(str1.count-1)).map{
        return "\(str1[str1.index(str1.startIndex, offsetBy: $0)...str1.index(str1.startIndex, offsetBy: $0 + 1)].uppercased())" }
        .filter {
            return $0.allSatisfy { (c) -> Bool in
                let v = c.asciiValue ?? 0
                return 65 <= v && v <= 90
            }
        }
    
    let arr2 = (0..<(str2.count-1)).map{
        return "\(str2[str2.index(str2.startIndex, offsetBy: $0)...str2.index(str2.startIndex, offsetBy: $0 + 1)].uppercased())" }
        .filter {
            return $0.allSatisfy { (c) -> Bool in
                let v = c.asciiValue ?? 0
                return 65 <= v && v <= 90
            }
        }
    // 합집합과 교집합의 원소의 개수를 구해 계산
    let sum: Double = Double(unionSet(arr1, arr2).count)
    let dif: Double = Double(interSet(arr1, arr2).count)
    let ans = sum == 0 ? 1 : dif / sum

    return Int(ans * 65536)
}

// 합집합
// 한 배열에서 같은것을 모두 찾아 골라내고 지운 뒤에
// 남아있는 것을 모두 합친다.
func unionSet(_ arr1: [String], _ arr2: [String]) -> [String] {
    var tmp1 = arr1
    var tmp2 = arr2
    var ans: [String] = []
    
    while !tmp1.isEmpty {
        if let first = tmp1.first {
            
            for i in 0..<tmp2.count {
                if first == tmp2[i] {
                    tmp2.remove(at: i)
                    break
                }
            }
            ans.append(first)
            tmp1.removeFirst()
        }
    }
    
    ans.append(contentsOf: tmp2)
    
    return ans
}

// 교집합
// 한배열에서 같은 것을 찾은 뒤 서로 지워버림
func interSet(_ arr1: [String], _ arr2: [String]) -> [String] {
    var tmp1 = arr1
    var tmp2 = arr2
    var ans: [String] = []
    
    while !tmp1.isEmpty {
        if let first = tmp1.first {
            for i in 0..<tmp2.count {
                if first == tmp2[i] {
                    ans.append(first)
                    tmp2.remove(at: i)
                    break
                }
            }
            tmp1.removeFirst()
        }
    }
    
    return ans
}
