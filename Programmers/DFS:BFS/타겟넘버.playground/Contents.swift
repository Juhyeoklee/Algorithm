import Foundation


func solution(_ numbers:[Int], _ target:Int) -> Int {

    var q: [Int] = []
    var qnums: [Int] = []
    q.append(0)

    var count = 0
    
    for (index, num) in numbers.enumerated() {
        qnums = q
        
        if index == numbers.count - 1 {
            q.forEach {
                if $0 + num == target || $0 - num == target {
                    count += 1
                }
            }
            break
        }
        q.removeAll()
        qnums.forEach {
            q.append($0 + num)
            q.append($0 - num)
        }
    }
    
    return count
}


