//
//  BOJ-9019.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/23.
//


// MARK:- Not Solved
var T = Int(readLine()!)!


func D(_ num: Int) -> Int { return num * 2 < 10_000 ? num * 2 : (num * 2) % 10_000 }

func S(_ num: Int) -> Int { return num - 1 > 0 ? num - 1 : 9999 }

func L(_ num: Int) -> Int { return (num % 1000) * 10 + (num / 1000) }

func R(_ num: Int) -> Int { return (num % 10) * 1000 + (num / 10) }

//
//print(
//S(0),L(123), R(123)
//)


func solution(_ num1: Int, _ num2: Int) -> String {
    var queue: [Int] = [num1]
    var check: [Bool] = [Bool](repeating: false, count: 10_001)
    var dist: [Int] = [Int](repeating: 0, count: 10_001)
    var how: [Character] = [Character](repeating: Character(" "), count: 10_001)
    var from: [Int] = [Int](repeating: 0, count: 10_001)
    
    while !queue.isEmpty {
        if let first = queue.first {
            var next = D(first)
            if !check[next] {
                check[next] = true
                dist[next] = dist[next] + 1
                from[next] = first
                how[next] = Character("D")
                queue.append(next)
                
            }
            next = S(first)
            if !check[next]{
                check[next] = true
                dist[next] = dist[next] + 1
                from[next] = first
                how[next] = Character("D")
                queue.append(next)
            }
            next = L(first)
            if !check[next] {
                check[next] = true
                dist[next] = dist[next] + 1
                from[next] = first
                how[next] = Character("L")
                queue.append(next)
            }
            next = R(first)
            if !check[next] {
                check[next] = true
                dist[next] = dist[next] + 1
                from[next] = first
                how[next] = Character("R")
                queue.append(next)
            }
            queue.removeFirst()
        }
    }

    var ans = ""
    var b = num2
    
    while num1 != b {
        ans += "\(how[b])"
        b = from[b]
    }
    
    return ans.reversed().map{ return "\($0)" }.reduce("", +)
}

while T != 0 {
    let arr = readLine()!.split(separator: " ").map{ return Int($0)! }

    print(
    solution(arr[0], arr[1])
    )
    T -= 1
}
