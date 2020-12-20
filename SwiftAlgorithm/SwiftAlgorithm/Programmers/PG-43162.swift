//
//  PG-43162.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/20.
//

import Foundation

// 그래프 탐색문제
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var map: [[Int]] = [[Int]](repeating: [], count: n)
    
    // 인접 노드 행렬을 만든다.
    for (row, c) in computers.enumerated() {
        for (column, d) in c.enumerated() {
            if row != column {
                if d == 1 {
                    map[row].append(column)
                }
            }
        }
    }
    
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var count = 0
    var i = 0
    
    // 노드를 0번부터 순회하면서
    // 경로 탐색을 진행한다.
    // 방문하지 않는 노드일 경우 count를 늘린다.
    while i < visited.count {
        let v = visited[i]
        if v == false {
            // bfs 풀이
            var q: [Int] = []
            q.append(i)
            visited[i] = true
            while !q.isEmpty {
                if let first = q.first {
                    for des in map[first] {
                        if !visited[des] {
                            q.append(des)
                            visited[des] = true
                        }
                    }
                    q.removeFirst()
                }
            }
            count += 1
        }
        i += 1
    }
    
    return count
}
