import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var tmp = board
    var s: [Int] = []
    var getNum: Int = 0
    var count = 0
    printArr(tmp)
    print()
    
    for mv in moves {
        getNum = 0
        print(mv)
        print()
        for i in 0..<board.count {
            if tmp[i][mv - 1] != 0 {
                getNum = tmp[i][mv - 1]
                tmp[i][mv - 1] = 0
                break
            }
        }
        
        if getNum != 0 {
            if let last = s.last {
                if last == getNum {
                    s.removeLast()
                    count += 2
                }
                else {
                    s.append(getNum)
                }
            }
            else {
                s.append(getNum)
            }
        }
        
        printArr(tmp)
        print()
        print(s)
        print()
        
    }
    return count
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])

func printArr(_ arr: [[Int]]) {
    for a in arr {
        print(a)
    }
}


