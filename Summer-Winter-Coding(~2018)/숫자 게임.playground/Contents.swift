import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var tmpA = a.sorted()
    var tmpB = b.sorted()
    var count = 0
    
    while !tmpA.isEmpty {
        guard let bLast = tmpB.last else {
            break
        }
        guard let aLast = tmpA.last else {
            break
        }
        
        if aLast < bLast {
            count += 1
            tmpA.removeLast()
            tmpB.removeLast()
        }
        else {
            tmpA.removeLast()
        }
    }
    
    
    return count
}

var a1 = [Int](repeating: 2, count: 10000)
var a2 = [Int](repeating: 1, count: 10000)
//solution([5,1,3,7], [2,2,6,8])
//solution([2,2,2,2], [1,1,1,1])
solution(a1, a2)

// 1, 3, 5, 7
// 2, 6, 8, 2
