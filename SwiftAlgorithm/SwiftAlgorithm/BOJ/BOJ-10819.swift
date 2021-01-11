//
//  BOJ-10819.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/12.
//

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{ return Int($0)! }

func solution() -> Int {
    var check: [Bool] = [Bool](repeating: false, count: N)
    
    // 정수 배열의 순서를 찾아내기위해 BFS 알고리즘을 이용
    func bfs(_ start: Int) -> Int {
        check = [Bool](repeating: false, count: N)
        var queue: [Int] = [start]
        check[start] = true
        var answer = 0
        
        while !queue.isEmpty {
            if let first = queue.first {
                var maxI = first
                var maxCount = 0
                
                // 주어진 수 중 가장 큰 차를 보이는 경로로 탐색을 진행한다.
                for i in 0..<N {
                    if first != i && !check[i] {
                        if maxCount < abs(A[first] - A[i]) {
                            maxCount = abs(A[first] - A[i])
                            maxI = i
                        }
                    }
                }
                // 차이를 탐색하면서 진행한다.
                answer += maxCount
                check[maxI] = true
                if first != maxI {
                    queue.append(maxI)
                }

                queue.removeFirst()
            }
        }
        return answer
    }
    var answer = 0
    for i in 0..<N {
        let rst = bfs(i)
        if answer < rst {
            answer = rst
        }
    }
    return answer
}

print(solution())
