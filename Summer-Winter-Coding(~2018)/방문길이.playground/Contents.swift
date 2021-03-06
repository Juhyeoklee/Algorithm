import Foundation

func solution(_ dirs:String) -> Int {
    
    var curPosition: (row: Int, col: Int) = (row: 5, col: 5)
    
    var verMemo: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 11), count: 10)
    var horMemo: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 11)
    
    
    let arr = Array(dirs)
    var count = 0
    // 0 : 위
    // 1 : 왼
    // 2 : 오
    // 3 : 아
    
    func move(to c: Character) {
        var desPosition = curPosition
        var memoPosition = curPosition
        var axis = 0
        // 0 : hor
        // 1 : ver
        switch c {
        case "U":
            desPosition.row -= 1
            memoPosition = desPosition
            axis = 1
            // pos : 4, 5
            // vermemo : 4, 5
        case "L":
            desPosition.col -= 1
            memoPosition = desPosition
            axis = 0
            // pos : 5, 4
            // hormemo : 5, 4
        case "R":
            desPosition.col += 1
            memoPosition = (row: desPosition.row, col: desPosition.col - 1)
            axis = 0
            // pos : 5, 6
            // hormemo : 5, 5
        case "D":
            // pos : 6, 5
            // vermemo : 5, 5
            desPosition.row += 1
            memoPosition = (row: desPosition.row - 1, col: desPosition.col)
            axis = 1
        default:
            print(c)
            break
        }
        if isValidRoute(position: desPosition) {
            if axis == 0 {
                if !horMemo[memoPosition.row][memoPosition.col] {
                    horMemo[memoPosition.row][memoPosition.col] = true
                    count += 1
                }
            }
            else {
                if !verMemo[memoPosition.row][memoPosition.col] {
                    verMemo[memoPosition.row][memoPosition.col] = true
                    count += 1
                }
            }
            curPosition = desPosition
        }
    }
    
    for a in arr {
        move(to: a)
    }
    
//    printArr(verMemo)
//    print()
//    printArr(horMemo)
    return count
}

func isValidRoute(position: (row: Int, col: Int)) -> Bool {
    return (position.row >= 0 && position.row <= 10) &&
        (position.col >= 0 && position.col <= 10)
}


func printArr(_ arr: [[Bool]]) {
    for a in arr {
        print(a)
    }
}



solution("ULURRDLLU")
solution("LULLLLLLU")
