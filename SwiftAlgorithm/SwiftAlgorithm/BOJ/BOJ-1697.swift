//
//  BOJ-1697.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/20.
//

func solution() -> Int {
    let input = readLine()!.split(separator: " ").map{ return Int($0)! }
    let N = input[0]
    let K = input[1]
    
    // 해당 위치에 최소 시간으로 도착힌 수를 저장
    var check: [Int] = [Int](repeating: Int.max, count: 100_001)
    // 시작 위치를 queue 에 push
    var queue: [Int] = [N]
    // 시작 위치는 0 초
    check[N] = 0
    while !queue.isEmpty {
        if let first = queue.first {
            let curTime = check[first]
            // 해당 위치의 최소 시간과 비교하여
            // 최소시간 보다 적은 시간에 도달한다면 check에 저장된 수를 바꾸고
            // queue에 푸쉬
            
            if first + 1 <= 100_000, check[first + 1] > curTime + 1 {
                check[first + 1] = curTime + 1
                queue.append(first + 1)
            }
            
            if first - 1 >= 0, check[first - 1] > curTime + 1 {
                check[first - 1] = curTime + 1
                queue.append(first - 1)
            }
            
            if first * 2 <= 100_000, check[first * 2] > curTime + 1 {
                check[first * 2] = curTime + 1
                queue.append(first * 2)
            }
            
            queue.removeFirst()
        }
    }
    
    
    return check[K]
}
