//
//  PG-42861.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/28.
//

import Foundation

// Kruskal 알고리즘 이용
// 간선의 cost를 오름차순으로 정렬한 뒤에
// 사이클 번호를 체크해 가며 하나씩 확인하여 선택한다.
// 만약 사이클이 생기는 경우를 제외한 나머지의 경우를 체크해 가며 모든 노드를 방문할때 반복문을 종료한다.
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    // 사이클 번호를 매기는 배열
    var parent: [Int] = [Int](repeating: 0, count: n)
    var pq: [(start:Int, des: Int, cost: Int)] = [(start:Int, des: Int, cost: Int)]()
    
    for c in costs {
        pq.append((start: c[0], des: c[1], cost: c[2]))
    }
    
    // 간선의 cost에 대한 오름차순으로 정렬
    pq = pq.sorted{ return $0.cost < $1.cost }
    var parentCount = 0
    var ans = 0
    
    while !parent.allSatisfy({ $0 != 0 }) {
        for e in pq {
            
            if parent[e.start] != 0 && parent[e.des] != 0 {
                // 사이클이 생기지 않는 경우에는 두 개의 싸이클 중 하나의 번호로 통일
                if parent[e.start] != parent[e.des] {
                    let pNum = parent[e.start]
                    parent = parent.map{
                        if $0 == pNum {
                            return parent[e.des]
                        }
                        return $0
                    }
                    ans += e.cost
                }
            }
            else if parent[e.start] != 0 && parent[e.des] == 0 {
                parent[e.des] = parent[e.start]
                ans += e.cost
            }
            else if parent[e.start] == 0 && parent[e.des] != 0 {
                parent[e.start] = parent[e.des]
                ans += e.cost
            }
            // 시작과 끝 지점 모두 방문하지 않았을 경우 싸이클 번호를 + 1하여 체크
            else {
                parentCount += 1
                parent[e.start] = parentCount
                parent[e.des] = parentCount
                ans += e.cost
            }
        }
    }
    return ans
}
