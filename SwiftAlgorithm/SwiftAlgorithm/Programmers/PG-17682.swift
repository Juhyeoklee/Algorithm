//
//  PG-17682.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/23.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var arr: [String] = []
    
    // 주어진 문자열을 숫자와 다른 것들로 분리
    var addStr = ""
    for s in dartResult {
        let tmpStr = addStr + "\(s)"
        
        if let _ = Int(tmpStr) {
            addStr = tmpStr
        }
        else {
            if addStr.count > 0 {
                arr.append(addStr)
            }
            arr.append("\(s)")
            addStr = ""
        }
    }
    
    // 이중 싱글, 더블, 트리플 액션만 우선 적으로 수행
    var answer1: [String] = []
    for (i, n) in arr.enumerated() {
        if n == "S" {
            answer1.append(arr[i-1])
        }
        else if n == "D" {
            answer1.append(double(arr[i-1]))
        }
        else if n == "T" {
            answer1.append(trible(arr[i-1]))
        }
        else if n == "*" || n == "#" {
            answer1.append(n)
        }
    }
    
    // 그 다음 스타상과 아차상 연산을 실행
    var i = 0
    while true {
        if i == answer1.count {
            break
        }
        
        if answer1[i] == "#" {
            answer1[i-1] = "-\(answer1[i-1])"
            answer1.remove(at: i)
            continue
        }
        
        if answer1[i] == "*" {
            if i != 1 {
                answer1[i-2] = "\(Int(answer1[i-2])! * 2)"
            }
            answer1[i-1] = "\(Int(answer1[i-1])! * 2)"
            answer1.remove(at: i)
            continue
        }
        
        i += 1
        
    }
    // 합을 리턴
    return answer1.map{ return Int($0)! }.reduce(0, +)
}

func double(_ num: String) -> String {
    let iNum = Int(num)!
    return String(iNum * iNum)
}

func trible(_ num: String) -> String {
    let iNum = Int(num)!
    return String(iNum * iNum * iNum)
}
