import Foundation

func solution(_ n:Int) -> Int {
    
    var arr: [Int] = [Int](repeating: 0, count: n + 1)
    
    arr[0] = 1
    arr[1] = 1
    
    if n < 2 {
        return arr[n]
    }
    
    for i in 2...n {
        arr[i] = (arr[i - 1] + arr[i - 2]) % 1234567
    }
    
    return arr[n]
}

solution(1)
solution(4)
solution(3)
