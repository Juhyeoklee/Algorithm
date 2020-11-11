//
//  BOJ1966.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/11.
//

import Foundation

struct PrinterQueue {
    var arr: [Int]
    var check: [Bool]
    var count = 0
    
    init(arr: [Int], findDocIndex: Int) {
        self.arr = arr
        self.check = [Bool](repeating: false, count: arr.count)
        self.check[findDocIndex] = true
    }
    
    mutating func print() {
        
        if let first = arr.first {
            var isPrint = true
            
            for n in arr.suffix(from: 1) {
                if first < n {
                    check.append(check.first!)
                    arr.append(first)
                    isPrint = false
                    break
                }
            }
            
            if isPrint {
                count += 1
            }
            arr.removeFirst()
            check.removeFirst()
        }
    }
    
    func isContainFindDoc() -> Bool {
        return check.contains(true)
    }
}


var T = Int(readLine()!)!
var answer: [Int] = []

while T != 0 {
    let inputs = readLine()!.components(separatedBy: " ")
    
    let M = Int(inputs[1])!
    let priorities = readLine()!
        .components(separatedBy: " ")
        .compactMap { return Int($0)! }
    
    var printerQueue = PrinterQueue(arr: priorities, findDocIndex: M)
    
    while printerQueue.isContainFindDoc() {
        printerQueue.print()
    }
    
    answer.append(printerQueue.count)
    T -= 1
}

for a in answer {
    print(a)
}
