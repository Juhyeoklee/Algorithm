import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var bridge: [Int] = Array(repeating: 0, count: bridge_length)
    var waitingQueue = truck_weights
    var curWeight = 0
    var sec = 0
    while !waitingQueue.isEmpty {
        sec += 1
        if let front = waitingQueue.first {
            if let bFront = bridge.first {
                curWeight -= bFront
                bridge.removeFirst()
            }
            if curWeight + front <= weight {
                curWeight += front
                waitingQueue.removeFirst()
                bridge.append(front)
            }
            else {
                bridge.append(0)
            }
        }
        print(bridge)
        
        
//        waitingQueue.removeFirst()
        
        
    }
    return sec + bridge_length
}


solution(100, 100, [10,10,10,10,10,10,10,10,10,10])
