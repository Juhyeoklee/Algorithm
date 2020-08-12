import Foundation
//
// -2 : 설치가 불가능한 지점
// -1 : 설치가 가능한 지점
func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    
    var roofMap: [[Int]] = Array(repeating: Array(repeating: -2, count: n), count: n + 1)
    var pillarMap: [[Int]] = Array(repeating: Array(repeating: -2, count: n + 1), count: n)
    pillarMap[0] = Array(repeating: -1, count: n + 1)
    // x, y : 설치 좌표
    // a : 설치할 구조물 종류
    //  ㄴ 0 : 기둥
    //  ㄴ 1 : 보
    // b : 설치 or 삭제
    //  ㄴ 0 : 삭제
    //  ㄴ 1 : 설치
    for item in build_frame {
        let x = item[0]
        let y = item[1]
        let kind = item[2]
        let function = item[3]
        
        // 삭제
        if function == 0 {
            if kind == 0 {
                pillarMap[y][x] = -1
                
            }
            else if kind == 1 {
                roofMap[y][x] = -1
            }
            var isValid = true
            
            for row in 0..<pillarMap.count {
                for column in 0..<pillarMap[row].count {
                    if pillarMap[row][column] < 0 {
                        continue
                    }
                    
                    if row == 0 {
                        continue
                    }
                    else if pillarMap[row - 1][column] != 0 {
                        
                        if column > 0 {
                            if roofMap[row][column] != 1 && roofMap[row][column - 1] != 1 {
                                isValid = false
                                break
                            }
                        }
                        else {
                            if roofMap[row][column] != 1 {
                                isValid = false
                                break
                            }
                        }
                    }
                }
            }
            for row in 0..<roofMap.count {
                for column in 0..<roofMap[row].count {
                    if roofMap[row][column] < 0 {
                        continue
                    }
                    
                    if pillarMap[row - 1][column] != 0 && pillarMap[row - 1][column + 1] != 0 {
                        print(row, column)
                        if column < n - 1 && column > 0 {
                            if roofMap[row][column + 1] != 1 || roofMap[row][column - 1] != 1 {
                                isValid = false
                                break
                            }
                        }
                        else if column == 0 {
                            isValid = false
                            break
                            
                        }
                        else if column == n - 1 {
                            isValid = false
                            break
                        }
                    }
                }
                if !isValid {
                    break
                }
            }
            
            if isValid {
                print(x, y, "삭제성공")
                for row in 0..<pillarMap.count {
                    for column in 0..<pillarMap[row].count {
                        if pillarMap[row][column] == -2 {
                            continue
                        }
                        else if pillarMap[row][column] == -1 {
                            if row > 0 {
                                if pillarMap[row - 1][column] != 1 {
                                    
                                }
                            }
                        }
                        else if pillarMap[row][column] == 0 {
                            if row + 1 < n {
                                if pillarMap[row + 1][column] < 0 {
                                    pillarMap[row + 1][column] = -1
                                }
                            }
                            
                            if row + 1 < n && column < n {
                                if roofMap[row + 1][column] < 0 {
                                    roofMap[row + 1][column] = -1
                                }
                            }
                            
                            if row + 1 < n && column > 0 {
                                if roofMap[row + 1][column - 1] < 0 {
                                    roofMap[row + 1][column - 1] = -1
                                }
                            }
                        }
                    }
                }
                
                for row in 0..<roofMap.count {
                    for column in 0..<roofMap[row].count {
                        if roofMap[row][column] == -2 {
                            continue
                        }
                        else if roofMap[row][column] == -1 {
                            
                        }
                        else if roofMap[row][column] == 1 {
                            if row < n {
                                if pillarMap[row][column + 1] < 0 {
                                    pillarMap[row][column + 1] = -1
                                }
                                
                                if pillarMap[row][column] < 0 {
                                    pillarMap[row][column] = -1
                                }
                            }
                        }
                    }
                }
            }
            else {
                print(y, x, "삭제실패")
                if kind == 0 {
                    pillarMap[y][x] = kind
                    
                }
                else if kind == 1 {
                    roofMap[y][x] = kind
                }
            }
        }
        // 설치
        else {
            // 기둥 일 때
            if kind == 0 {
                
                if pillarMap[y][x] == -1 {
                    pillarMap[y][x] = kind
                    
                    if y + 1 < n {
                        pillarMap[y + 1][x] = -1
                    }
                    
                    if y + 1 <= n && x < n {
                        roofMap[y + 1][x] = -1
                    }
                    
                    if y + 1 <= n && x - 1 >= 0 {
                        roofMap[y + 1][x - 1] = -1
                    }
                }
            }
                // 보 일때
            else {
                if roofMap[y][x] == -1 {
                    roofMap[y][x] = kind
                    
                    if y < n {
                        pillarMap[y][x] = -1
                        pillarMap[y][x + 1] = -1
                        
                    }
                }
                else {
                    if ( x > 0 && roofMap[y][x-1] == 1) && (x + 1 < n && roofMap[y][x+1] == 1) {
                        roofMap[y][x] = kind
                        if y < n {
                            pillarMap[y][x] = -1
                            pillarMap[y][x + 1] = -1
                            
                        }
                    }
                }
            }
        }
    }
    
    
        print("기둥 :",pillarMap)
        print("지붕 :",roofMap)
    
    for row in 0..<pillarMap.count {
        for column in 0..<pillarMap[row].count {
            if pillarMap[row][column] == 0 {
                answer.append([column, row, 0])
            }
        }
    }
    for row in 0..<roofMap.count {
        for column in 0..<roofMap[row].count {
            if roofMap[row][column] == 1 {
                answer.append([column, row, 1])
            }
        }
    }
    
    
    return answer.sorted {
        if $0[0] < $1[0] {
            return $0[0] < $1[0]
        }
        else if $0[0] == $1[0] {
            if $0[1] < $1[1] {
                return $0[1] < $1[1]
            }
            else if $0[1] == $1[1] {
                return $0[2] < $1[2]
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }
}

// , [3, 2, 1, 0]
solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1],[3, 2, 1, 0], [2, 2, 1, 0], [4, 2, 1, 0], [5, 1, 0, 0]])
solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1],[2, 1, 1, 0], [4, 0, 0, 0], [0, 0, 0, 0], [3, 1, 1, 0], [0, 1, 1, 0]])

//solution(5, )
