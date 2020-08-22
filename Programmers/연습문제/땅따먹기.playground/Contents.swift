import Foundation

var memo: [[Int]] = []
var lands: [[Int]] = []
func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var rowCount = land.count - 1
    
    memo = Array(repeating: Array(repeating: -1, count: 4), count: land.count)
    lands = land
    memo[0] = land[0]
    
    answer = [
        dp(rowCount, 0),
        dp(rowCount, 1),
        dp(rowCount, 2),
        dp(rowCount, 3)
        ].max()!
    
    return answer
}

func dp(_ row: Int, _ col: Int) -> Int {
    if row == 0 {
        return memo[0][col]
    }
    if memo[row][col] > 0 {
        return memo[row][col]
    }
    
    var maxNum = 0
    var tmp = 0
    
    for i in 0...3 {
        if i == col {
            continue
        }
        tmp = dp(row - 1, i)
        if maxNum < tmp {
            maxNum = tmp
        }
    }
    
    memo[row][col] = maxNum + lands[row][col]

    
    return memo[row][col]
}
