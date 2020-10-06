import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var winMap: [[Int]] = [[Int]](repeating: [], count: n + 1)
    var loseMap: [[Int]] = [[Int]](repeating: [], count: n + 1)
    var answer = 0
    for r in results {
        winMap[r[0]].append(r[1])
        loseMap[r[1]].append(r[0])
    }
    
    for i in 1...n {
        var check: [Bool] = [Bool](repeating: false, count: n + 1)
        var queue: [Int] = []
        var count = 0
        
        check[i] = true
        queue.append(i)
        
        while !queue.isEmpty {
            if let first = queue.first {
                for des in winMap[first] {
                    if !check[des] {
                        check[des] = true
                        queue.append(des)
                        count += 1
                    }
                }
                queue.removeFirst()
            }
        }
        
        check = [Bool](repeating: false, count: n + 1)
        queue.removeAll()
        
        check[i] = true
        queue.append(i)
        
        while !queue.isEmpty {
            if let first = queue.first {
                for des in loseMap[first] {
                    if !check[des] {
                        check[des] = true
                        queue.append(des)
                        count += 1
                    }
                }
                queue.removeFirst()
            }
        }
        
        if count == n - 1 {
            answer += 1
        }
        
    }

    return answer
}


solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])

func printArr(_ arr: [[Int]]) {
    for (i, a) in arr.enumerated() {
        print(i, a)
    }
    print()
}
var a = [1,2,3]

//if let n = a[3] {
//    print(n)
//}
