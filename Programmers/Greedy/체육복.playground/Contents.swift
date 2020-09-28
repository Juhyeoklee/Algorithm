import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var count = 0
    var isReserves: [Bool] = [Bool](repeating: false, count: n + 1)
    var isLosts: [Bool] = [Bool](repeating: false, count: n + 1)
    
    for l in lost {
        isLosts[l] = true
    }
    for r in reserve {
        isReserves[r] = true
    }
    for l in lost {
        
        if isReserves[l] {
            isReserves[l] = false
            isLosts[l] = false
        }
    }
    
    for i in 1...n {
        if isLosts[i] {
            
            if i > 1 && isReserves[i - 1] {
                isReserves[i - 1] = false
                count += 1
            }
            else if i < n && isReserves[i + 1] {
                isReserves[i + 1] = false
                count += 1
            }
        }
        else {
            count += 1
        }
    }

    return count
}



solution(5, [2,4], [1, 3, 5])
solution(5, [2, 4], [3])
solution(3, [3], [1])
solution(3, [1,2], [2,3])
