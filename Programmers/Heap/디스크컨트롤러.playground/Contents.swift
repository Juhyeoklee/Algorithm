import Foundation

struct PriorityQueue {
    var queue: [[Int]] = []
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    func first() -> [Int]? {
        if queue.isEmpty {
            return nil
        }
        
        var minIndex = 0
        var minNum = 9999
        
        for (i, q) in queue.enumerated() {
            if q[1] < minNum {
                minIndex = i
                minNum = q[1]
            }
        }
        
        return queue[minIndex]
    }
    
    mutating func append(contentsOf arr: [[Int]]) {

        queue.append(contentsOf: arr)
    }
    
    mutating func removeFirst() {
        if queue.isEmpty {
            return
        }
        var minIndex = 0
        var minNum = 9999
        
        for (i, q) in queue.enumerated() {
            if q[1] < minNum {
                minIndex = i
                minNum = q[1]
            }
        }
        
        queue.remove(at: minIndex)
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    
    
    var tmp = jobs
    var waitingQueue = PriorityQueue()
    var answer: Int = 0
    var sec: Int = 0
    
    while true {
        
        if waitingQueue.isEmpty && tmp.isEmpty {
            break
        }
        waitingQueue.append(contentsOf: tmp.filter({ (a1) -> Bool in
            return a1[0] <= sec
        }))
        
        tmp = tmp.filter({ (a1) -> Bool in
            return a1[0] > sec
        })
        
        if let first = waitingQueue.first() {
            if first[0] <= sec {
                answer += sec + first[1] - first[0]
                waitingQueue.removeFirst()
                sec += first[1]
            }
            else {
                sec += 1
            }
        }
        else {
            sec += 1
        }
    }
    
    return answer / jobs.count
}


solution([[0, 3], [9, 4]])


//var a = [
//    226,
//41,
//240,
//10,
//359,
//74,
//90,
//503,
//258,
//234,
//253,
//222,
//124,
//437,
//231,
//159,
//327,
//563,
//22,
//423,
//361,
//97,
//213,
//335,
//245,
//107,
//45,
//517,
//]
//
//
//for i in a {
//    print("UPDATE YB_27 SET IsPassed = 1 WHERE CANDIDATE_IDX = '\(i)';")
//}
