import Foundation


struct Postion {
    var row: Int
    var colum: Int
    
    // axis
    // 0 : 세로
    // 1 : 가로
    var axis: Int?
    var cost: Int
    
}

func solution(_ board:[[Int]]) -> Int {

    var map: [[Int]] = [[Int]](repeating: [Int](repeating: Int.max, count: board[0].count), count: board.count)
    

    func isValidRoute(_ curPosition: Postion, _ desPosition: Postion) -> Bool {
        if desPosition.row < 0 || desPosition.row > board.count - 1 {
            return false
        }
        
        if desPosition.colum < 0 || desPosition.colum > board[0].count - 1 {
            return false
        }
        
        if board[desPosition.row][desPosition.colum] == 1 {
            return false
        }
        
        return true
    }
    
    var queue: [Postion] = []
    map[0][0] = 0
    queue.append((Postion(row: 0, colum: 0, cost: 0)))

    while !queue.isEmpty {
        if let first = queue.first {
            if let axis = first.axis {
                
                var uDes = Postion(row: first.row - 1,
                                   colum: first.colum,
                                   axis: 0,
                                   cost: first.cost)
                var lDes = Postion(row: first.row,
                                   colum: first.colum - 1,
                                   axis: 1,
                                   cost: first.cost)
                var rDes = Postion(row: first.row,
                                   colum: first.colum + 1,
                                   axis: 1,
                                   cost: first.cost)
                var dDes = Postion(row: first.row + 1,
                                   colum: first.colum,
                                   axis: 0,
                                   cost: first.cost)
                
                let curPrice = first.cost
                
                if isValidRoute(first, uDes) {
                    uDes.cost += 100
                    
                    if axis != uDes.axis {
                        uDes.cost += 500
                    }
                    if map[uDes.row][uDes.colum] >= uDes.cost {
                        map[uDes.row][uDes.colum] = uDes.cost
                        queue.append(uDes)
                    }
                }
                if isValidRoute(first, lDes) {
                    lDes.cost += 100
                    
                    if axis != lDes.axis {
                        lDes.cost += 500
                    }
                    if map[lDes.row][lDes.colum] >= lDes.cost {
                        map[lDes.row][lDes.colum] = lDes.cost
                        queue.append(lDes)
                    }
                }
                if isValidRoute(first, rDes) {
                    rDes.cost += 100

                    if axis != rDes.axis {
                        rDes.cost += 500
                    }
                    if map[rDes.row][rDes.colum] >= rDes.cost {
                        map[rDes.row][rDes.colum] = rDes.cost
                        queue.append(rDes)
                    }
                }
                if isValidRoute(first, dDes) {
                    dDes.cost += 100
                    
                    if axis != dDes.axis {
                        dDes.cost += 500
                    }
                    if map[dDes.row][dDes.colum] >= dDes.cost {
                        map[dDes.row][dDes.colum] = dDes.cost
                        queue.append(dDes)
                    }
                }
            }
            else {
                let vDes = Postion(row: first.row + 1,
                                   colum: first.colum,
                                   axis: 0,
                                   cost: first.cost + 100)
                
                let hDes = Postion(row: first.row,
                                   colum: first.colum + 1,
                                   axis: 1,
                                   cost: first.cost + 100)
                
                if isValidRoute(first, vDes) {
                    map[vDes.row][vDes.colum] = vDes.cost
                    queue.append(vDes)
                }
                if isValidRoute(first, hDes) {
                    map[hDes.row][hDes.colum] = hDes.cost
                    queue.append(hDes)
                }
            }
            queue.removeFirst()
        }
    }
    
//    printArr(map)
    
    return map[board.count - 1][board.count - 1]
}

func printArr(_ arr: [[Int]]) {
    for a in arr {
        for i in a {
            var n = i
            if i == Int.max {
                n = 0
            }
            print(n, terminator: "\t\t")
        }
        print()
    }
}


//solution([[0, 0], [1, 0]])
solution([[0,0,0],[0,0,0],[0,0,0]])
solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])
solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]])
solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]])
