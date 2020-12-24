//
//  PG-68936.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/25.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    var tmp: [Int] = compress(arr)
    
    let oneCount = tmp.filter{ return $0 == 1 }.count
    return [tmp.count - oneCount, oneCount]
}


// recursive 함수
func compress(_ arr: [[Int]]) -> [Int] {
    // 해당 배열이 모두 동일한 값을 갖고 있다면
    if judgeComponets(arr) {
        // 해당 값을 배열로 감싸 반환
        return [arr[0][0]]
    }
    
    // 아닌 경우
    // 배열을 문제에서 말한 것 과 같이 4분할 하여
    let split = changeArr(arr)
    var tmp: [Int] = []
    
    // 각각 영역을 다시 compress 함수를 호출하여 확인한다.
    tmp.append(contentsOf: compress(split[0]))
    tmp.append(contentsOf: compress(split[1]))
    tmp.append(contentsOf: compress(split[2]))
    tmp.append(contentsOf: compress(split[3]))
    
    return tmp
}

// 해당 배열이 통일되어 있는지 확인
func judgeComponets(_ arr: [[Int]]) -> Bool {
    
    let index = arr[0][0]
    
    for i in arr {
        for j in i {
            if j != index {
                return false
            }
        }
    }
    
    return true
}

// 주어진 배열을 4분할 하는 함수
func changeArr(_ arr: [[Int]]) -> [[[Int]]] {
    let splitNum = arr.count / 2
    
    var splitArr: [[[Int]]] = [[[Int]]](repeating: [[Int]](), count: 4)
    for row in 0..<arr.count {
        var tmp: [[Int]] = [[]]
        
        for col in 0..<arr[0].count {
            tmp[0].append(arr[row][col])
            
            if tmp[0].count >= arr.count / 2 {
                if row < arr.count / 2 {
                    if col < arr.count / 2 {
                        splitArr[0].append(contentsOf: tmp)
                    }
                    else {
                        splitArr[1].append(contentsOf: tmp)
                    }
                }
                else {
                    if col < arr.count / 2 {
                        splitArr[2].append(contentsOf: tmp)
                    }
                    else {
                        splitArr[3].append(contentsOf: tmp)
                    }
                }
                tmp = [[]]
            }
        }
    }
    
    return splitArr
}
