//
//  BOJ-1722.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/03.
//

import Foundation

// Factorial을 만드는 extension 메소드 작성
extension Int {
    func getFactorial() -> Int64 {
        var ans: Int64 = 1
        if self == 0 {
            return 1
        }
        for i in 1...self {
            ans *= Int64(i)
        }
        
        return ans
    }
}
let N = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{ return Int64($0)! }

// k 번째 수열을 구하는 함수
func getPer(_ k: Int64) -> [Int] {
    
    var per = (1...N).map{ return $0 }
    var answer: [Int] = []
    var count = k
    
    var index = 0
    // 앞자리부터 차례대로 하나씩 집어넣으며 경우의 수를 더한다.
    // 만약 경우의 수가 k 보다 많아지면 그 숫자를 넣고 다음 자리로 옮겨 경우의 수를 구한다.
    while index != N-1 {
        for i in 0..<per.count {
            
            let fac = (N - index - 1).getFactorial()
            if count - fac <= 0 {
                answer.append(per[i])
                per.remove(at: i)
                index += 1
                break
            }
            else {
                count -= fac
            }
        }
    }
    
    return answer + per
}

// 주어진 순열이 몇번째 순열인지 구하기
func getK(_ expectPer: [Int]) -> Int64 {
    var per = (1...N).map{ return $0 }
    var count: Int64 = 1
    
    // 앞자리부터 하나씩 경우의 수를 더해 나간다.
    // 순서대로 나열했을 때 정해진 지점에 원하는 수가 나타나는 경우의 수를 구하여 더한다.
    // 그리고 다음 순서로 이동
    for (i, num) in expectPer.enumerated() {
        var c = 0
        for fNum in per {
            if fNum == num {
                break
            }
            c += 1
        }
        if (N - i - 1) == 0 {
            break
        }
        per.remove(at: c)
        count += (N - i - 1).getFactorial() * Int64(num - 1 - (num - 1 - c))
    }
    
    return count
}

func solution() {
    if input[0] == 1 {
        for n in getPer(input[1]) {
            print(n, terminator: " ")
        }
        print()
    }
    else {
        print(
            getK(input[1..<input.count].map{ return Int($0) })
        )
    }
}

