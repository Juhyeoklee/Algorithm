import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var arr: [[Int]] = [[Int]](repeating: [Int](), count: n + 1)
    var check: [Int] = [Int](repeating: 0, count: n + 1)
    for eg in edge {
        arr[eg[0]].append(eg[1])
        arr[eg[1]].append(eg[0])
    }
    
    var queue: [(vertex: Int, depth: Int)] = []
    check[1] = 1
    queue.append((vertex: 1, depth: 1))
    var max = 1
    while !queue.isEmpty {
        if let first = queue.first {
            for des in arr[first.vertex] {
                if check[des] == 0 {
                    check[des] = first.depth + 1
                    
                    if max < first.depth + 1 {
                        max = first.depth + 1
                    }
                    queue.append((vertex: des, depth: first.depth + 1))
                }
            }
        }
        
        queue.removeFirst()
    }
    var count = 0
    
    for n in check {
        if n == max {
            count += 1
        }
    }
    
    return count
}


solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
