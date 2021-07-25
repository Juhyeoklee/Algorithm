//
//  PG-77485.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/25.
//

import Foundation

typealias Point = (row: Int, col: Int)

func solution_PG77485(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var map = makeMap_PG77485(row: rows, col: columns)
    var result: [Int] = []
    for q in queries {
        result.append(
            rotateMap_PG77485(leftTopPoint: (row: q[0], col: q[1]),
                              rightBottmPoint: (row: q[2], col: q[3]),
                              map: &map)
        )
    }
    return result
}

func makeMap_PG77485(row: Int, col: Int) -> [[Int]] {
    var map = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
    
    for num in 1...row * col {
        map[Int((num - 1) / col)][(num - 1) % col] = num
    }
    
    return map
}

func rotateMap_PG77485(
    leftTopPoint: Point,
    rightBottmPoint: Point,
    map: inout [[Int]]
) -> Int {
    var minimum = Int.max
    let tmpMap = map
    
    // 상단 가로 이동
    for col in leftTopPoint.col-1..<rightBottmPoint.col-1 {
        let row = leftTopPoint.row-1
        let num = tmpMap[row][col]
        minimum = num < minimum ? num : minimum
        
        map[row][col+1] = num
    }
    
    // 하단 가로 이동
    for col in leftTopPoint.col...rightBottmPoint.col-1 {
        let row = rightBottmPoint.row-1
        let num = tmpMap[row][col]
        minimum = num < minimum ? num : minimum
        map[row][col-1] = num
    }
    
    // 좌측 세로 이동
    for row in leftTopPoint.row...rightBottmPoint.row-1 {
        let col = leftTopPoint.col-1
        let num = tmpMap[row][col]
        minimum = num < minimum ? num : minimum
        map[row-1][col] = num
    }
    
    // 우측 세로 이동
    for row in leftTopPoint.row-1..<rightBottmPoint.row-1 {
        let col = rightBottmPoint.col-1
        let num = tmpMap[row][col]
        minimum = num < minimum ? num : minimum
        map[row+1][col] = num
    }
    return minimum
}
