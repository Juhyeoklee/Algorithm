//
//  PG-81302.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/18.
//

import Foundation

func solution_PG81302(_ places:[[String]]) -> [Int] {
    var answer: [Int] =  [Int](repeating: 1, count: places.count)
    for (i, place) in places.enumerated() {
        let placeMap = place.map { $0.map { "\($0)" }}
        var map = makeMap_PG81302(place)
        
        mainLoop: for row in 0..<5 {
            for col in 0..<5 {
                if placeMap[row][col] == "P" {
                    if map[row][col] != "" {
                        placePerson_PG81302(row: row, col: col, map: &map)
                    }
                    else {
                        answer[i] = 0
                        break mainLoop
                    }
                }
            }
        }
    }
    return answer
}

func makeMap_PG81302(_ arr: [String]) -> [[String]] {
    return arr.map { $0.map { $0 == "P" ? "O" : "\($0)" } }
}

func placePerson_PG81302(row: Int, col: Int, map: inout [[String]]) {
    if row - 1 >= 0 && map[row-1][col] == "O" { map[row-1][col] = "" }
    if row - 2 >= 0 && map[row-2][col] == "O" && map[row-1][col] != "X" { map[row-2][col] = "" }
    if row + 1 <= 4 && map[row+1][col] == "O" { map[row+1][col] = "" }
    if row + 2 <= 4 && map[row+2][col] == "O" && map[row+1][col] != "X" { map[row+2][col] = "" }
    if col - 1 >= 0 && map[row][col-1] == "O" { map[row][col-1] = "" }
    if col - 2 >= 0 && map[row][col-2] == "O" && map[row][col-1] != "X" { map[row][col-2] = "" }
    if col + 1 <= 4 && map[row][col+1] == "O" { map[row][col+1] = "" }
    if col + 2 <= 4 && map[row][col+2] == "O" && map[row][col+1] != "X" { map[row][col+2] = "" }
    if row - 1 >= 0 && col - 1 >= 0 && map[row-1][col-1] == "O" &&
        !(map[row-1][col] == "X" && map[row][col-1] == "X") {
        map[row-1][col-1] = ""
    }
    if row - 1 >= 0 && col + 1 <= 4 && map[row-1][col+1] == "O"
        && !(map[row-1][col] == "X" && map[row][col+1] == "X") {
        map[row-1][col+1] = ""
    }
    if row + 1 <= 4 && col - 1 >= 0 && map[row+1][col-1] == "O" &&
        !(map[row+1][col] == "X" && map[row][col-1] == "X") {
            map[row+1][col-1] = ""
    }
    if row + 1 <= 4 && col + 1 <= 4 && map[row+1][col+1] == "O" &&
        !(map[row+1][col] == "X" && map[row][col+1] == "X"){
        map[row+1][col+1] = ""
    }
}
