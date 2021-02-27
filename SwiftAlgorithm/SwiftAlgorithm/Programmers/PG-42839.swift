//
//  PG-42839.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/02/28.
//

import Foundation

func solution(_ numbers:String) -> Int {
    
    var count = 0
    
    for n in makePer(numbers.map{ return "\($0)" }) {
        if isPrime(n) {
            count += 1
        }
    }
    return count
}

func makePer(_ numbers: [String]) -> [Int] {
    var answer: Set<Int> = Set<Int>()
    
    func findRoute(_ curString: String,_ destination: Int ,_ check: [Bool]) {
        
        var tmpCheck = check
        tmpCheck[destination] = true
        let tmpString = curString + numbers[destination]
        answer.insert(Int(tmpString)!)
        for i in 0..<tmpCheck.count {
            if !tmpCheck[i] {
                findRoute(tmpString, i, tmpCheck)
            }
        }
    }
    for i in 0..<numbers.count {
        findRoute("", i, [Bool](repeating: false, count: numbers.count))
    }
    print(answer)
    return answer.map{ return $0 }
}

func isPrime(_ num: Int) -> Bool {
    if num <= 1{
        return false
    }
    
    var i = 2
    
    while i*i <= num {
        if num % i == 0 {
            return false
        }
        i += 1
    }
    return true
}
