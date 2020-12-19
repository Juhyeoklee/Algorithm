//
//  놀이공원.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/19.
//

let input = readLine()!
var T = Int(input)!
var map: [[Int]] = []
var answer: [Int] = []

// 스캔하는 영역에서 폐기물을 찾는 함수
func findSpace(_ row: Int, _ column: Int, k: Int) -> Int {
    var count = 0
    for i in row..<(row + k) {
        for j in column..<(column + k) {
            if map[i][j] == 1 {
                count += 1
            }
        }
    }
    
    return count
}

// 지도를 k*k 크기의 사이즈로 스캔하는 함수
func scanSpace(_ k: Int) -> Int {
    var min = Int.max
    
    for i in 0...(map.count - k) {
        for j in 0...(map[0].count - k) {
            let count = findSpace(i, j, k: k)
            if min > count {
                min = count
            }
        }
    }
    return min
}

// 입출력
for _ in 0..<T {
    map = []
    let nk = readLine()!.split(separator: " ").compactMap{ return Int($0) }
    
    for _ in 0..<nk[0] {
        map.append(readLine()!.split(separator: " ").compactMap{ Int($0)! })
    }
    answer.append(scanSpace(nk[1]))
}


for i in answer {
    print(i)
}
