//
//  PG-72410.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/30.
//

import Foundation

func solution(_ new_id:String) -> String {
    return seven(six(five(four(three(two(one(new_id)))))))
}

func one(_ str: String) -> String {
    return str.lowercased()
}

func two(_ str: String) -> String {
    return str.filter {
        if $0.isNumber || ["-", "_", "."].contains("\($0)") || ($0.asciiValue! >= 97 && $0.asciiValue! <= 122) {
            return true
        }
        return false
    }
}

func three(_ str: String) -> String {
    var tmp = str.map{ return "\($0)" }
    var isComplete = false
    
    while !isComplete {
        
        isComplete = true
        for i in (1..<tmp.count).reversed() {
            if tmp[i] == ".", tmp[i-1] == "." {
                tmp.remove(at: i)
                isComplete = false
                
            }
        }
    }
    return tmp.reduce("", +)
}

func four(_ str: String) -> String {
    var arr = str.map{ return "\($0)" }
    if let first = arr.first {
        if first == "." {
            arr.removeFirst()
        }
    }
    if let last = arr.last {
        if last == "." {
            arr.removeLast()
        }
    }
    return arr.reduce("", +)
}

func five(_ str: String) -> String {
    if str.count == 0 {
        return "a"
    }
    
    return str
}

func six(_ str: String) -> String {
    let arr = str.map { return "\($0)" }
    
    if arr.count > 15 {
        return four(arr[0...14].reduce("", +))
    }
    return str
}

func seven(_ str: String) -> String {
    var arr = str.map { return "\($0)" }
    
    while arr.count < 3 {
        if let last = arr.last {
            arr.append(last)
        }
    }
    
    return arr.reduce("", +)
}
