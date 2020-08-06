import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var q: [Int] = priorities
    q[location] += 10
    
    var count = 0
    while !q.isEmpty {
        
        if let front = q.first {
            q.removeFirst()
            var canPrint: Bool = true
            var reqNum = front
            
            if front > 10 {
                reqNum -= 10
            }
            for num in q {
                var n = num
                
                if num > 10 {
                    n -= 10
                }
                
                if reqNum < n {
                    q.append(front)
                    canPrint = false
                    break
                }
            }
            
            if canPrint {
                count += 1
                if front > 10 {
                    break
                }
            }
        }
    }
    return count
}

solution([1, 1, 9, 1, 1, 1], 0)




