import Foundation
//typealias Work = (progress: Int, speed: Int)

struct Work {
    var progress: Int
    var speed: Int
}
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var works: [Work] = []
    var answer: [Int] = []
    for i in 0..<progresses.count {
        works.append(Work(progress: progresses[i], speed: speeds[i]))
    }
    
    var day = 0
    while !works.isEmpty {
        day += 1
        
        for i in 0..<works.count {
            works[i].progress += works[i].speed
        }
        var count = 0
        while true {
            
            if let front = works.first {
                if front.progress >= 100 {
                    works.removeFirst()
                    count += 1
                
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
        if count != 0 {
            answer.append(count)
        }
        
    }
    return answer
}

solution([93,30,55], [1,30,5])
