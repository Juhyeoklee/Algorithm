//
//  BOJ-10971.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/14.
//

let N = Int(readLine()!)!
var W = [[Int]]()



func solution() -> Int {
    for _ in 0..<N {
        W.append(readLine()!.split(separator: " ").map{ return Int($0)! })
    }
    
    var answer = Int.max
    
    // 모든 경로를 탐색
    // 방문한 지점에 대한 정보와 현재 위치, 그리고 사용한 cost등을 재귀를 통해 넘겨주어 경로를 확인한다.
    func recur(_ initial: Int, _ start: Int, _ checkArr: [Bool], _ cost: Int) {
        var tmp = checkArr
        tmp[start] = true
        
        // 모든 지점에 도달할 경우
        if tmp.allSatisfy({ return $0 }) {
            let rst = cost + W[start][initial]
            // 마지막으로 도달한 지점과 초기지점을 연결한 값을 더해 최소값을 구해간다.
            // 이 때 마지막 지점과 초기 지점이 연결되어 있어야 한다.
            if answer > rst, W[start][initial] != 0 {
                answer = rst
            }
            return
        }
        
        
        for (i, c) in W[start].enumerated() {
            // 현재 위치에서 방문하지 않고 연결된 지점에 대해 재귀함수를 호출한다.
            if !tmp[i], c != 0 {
                recur(initial, i, tmp, cost + c)
            }
        }
        
    }
    
    (0..<N).forEach {
        recur($0, $0, [Bool](repeating: false, count: N), 0)
    }
    
    
    return answer
}

print(solution())
