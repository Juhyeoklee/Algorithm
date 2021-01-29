//
//  BOJ-1759.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/29.
//

func solution() {
    let input = readLine()!.split(separator: " ").map { return Int($0)! }

    let alphabets = readLine()!.split(separator: " ").map { return "\($0)" }
    let L = input[0]
    let C = input[1]
    let 모음 = ["a", "e", "i", "o", "u"]
    var answer: [String] = []
    
    func check(_ str: String) -> Bool {
        let arr = str.map { return "\($0)" }
        var c모음 = 0
        var c자음 = 0
        for a in arr {
            if 모음.contains(a) {
                c모음 += 1
            }
            else {
                c자음 += 1
            }
        }
        if c모음 >= 1, c자음 >= 2 {
            return true
        }
        
        return false
    }
    
    func recur(_ cur: String, _ i: Int) {
        if cur.count == L {
            if check(cur) {
                answer.append(cur.sorted().map{ return "\($0)"}.reduce("", +))
            }
            return
        }
        if i == C - 1 {
            return
        }
        
        recur(cur + alphabets[i+1], i+1)
        recur(cur, i+1)
        
    }
    recur("", -1)
    for a in answer.sorted() {
        print(a)
    }
}
