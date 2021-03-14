//
//  PG-60061.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/14.
//

import Foundation

enum Oper: Int {
    case 삭제 = 0
    case 설치 = 1
}
enum Kind: Int {
    case 기둥 = 0
    case 보 = 1
}

func isValidMap(map: [[Int]]) -> Bool {
    let pillarN = map[1].count
    let roofN = map[0].count
    // 맵을 전부 탐색하며
    // 기둥이나 지붕에 대해 유효한 조건인지 체크
    for iRow in 0..<map.count {
        for iCol in 0..<map[iRow].count {
            if map[iRow][iCol] == 0 {
                if iRow % 2 == 0 {
                    // 지붕
                    if map[iRow-1][iCol] == 0 {
                        continue
                    }
                    if map[iRow-1][iCol + 1] == 0 {
                        continue
                    }
                    
                    if iCol > 0 && iCol < roofN - 1
                       ,map[iRow][iCol - 1] == 0 && map[iRow][iCol + 1] == 0 {
                        continue
                    }
                    return false
                    
                }
                else {
                    // 기둥
                    if iRow == 1 {
                        continue
                    }
                    if iRow > 1, map[iRow - 2][iCol] == 0 {
                        continue
                    }
                    if iCol > 0, map[iRow-1][iCol-1] == 0 {
                        continue
                    }
                    
                    if iCol < pillarN - 1, map[iRow-1][iCol] == 0 {
                        continue
                    }
                    return false
                }
            }
        }
    }
    
    return true
}

func work(map: inout [[Int]], item: [Int]) {
    let col = item[0]
    let row = item[1]
    let kind: Kind = Kind(rawValue: item[2])!
    let oper: Oper = Oper(rawValue: item[3])!
    
    var tmpMap = map
    // 각 동작을 임시로 만든 map에 실행시킨 뒤
    switch oper {
    case .삭제:
        if kind == .기둥 {
            tmpMap[row*2 + 1][col] = -1
        }
        // 지붕
        else {
            tmpMap[row*2][col] = -1
        }
    case .설치:
        if kind == .기둥 {
            tmpMap[row*2 + 1][col] = 0
        }
        else {
            tmpMap[row*2][col] = 0
        }
    }
    // 해당 맵이 유효한지 체크한다.
    if isValidMap(map: tmpMap) {
        map = tmpMap
    }
}

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    var map: [[Int]] = []
    map.append(Array(repeating: -1, count: n))
    
    for _ in 0..<n {
        map.append(Array(repeating: -1, count: n + 1))
        map.append(Array(repeating: -1, count: n))
    }
    // 짝수 열은 기둥
    // 홀수 열은 지붕
    // 각각 동작에 대해 work란 함수를 호출
    for item in build_frame {
        work(map: &map, item: item)
    }
    
    var answer: [[Int]] = []
    // 모든 동작이 완료된 후에 map을 탐색하며 return하는 값의 조건에 맞게 배열을 만든다.
    for iRow in 0..<map.count {
        for iCol in 0..<map[iRow].count {
            if map[iRow][iCol] == 0 {
                // 지붕
                if iRow % 2 == 0 {
                    answer.append([iCol, iRow / 2, 1])
                }
                // 기둥
                else {
                    answer.append([iCol, Int(floor(Double(iRow) / 2)), 0])
                }
            }
        }
    }
    
    // 만들어진 배열을 조건에 맞게 정렬하여 리턴한다.
    return answer.sorted { (a1, a2) -> Bool in
        if a1[0] == a2[0] {
            if a1[1] == a2[1] {
                return a1[2] < a2[2]
            }
            return a1[1] < a2[1]
        }
        return a1[0] < a2[0]
    }
}
