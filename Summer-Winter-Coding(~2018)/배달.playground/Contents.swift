import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    var map: [[(Int, Int)]] = Array(repeating: [], count: N + 1)
    var check: [Int] = Array(repeating: 9999999999, count: N + 1)
    var q: [Int] = []
    
    for r in road {
        map[r[0]].append((r[1], r[2]))
        map[r[1]].append((r[0], r[2]))
    }
    
    check[1] = 0
    q.append(1)
    
    
    while !q.isEmpty {
        if let front = q.first {

            for (des, weight) in map[front] {
                
                if check[des] > check[front] + weight {
                    q.append(des)
                    check[des] = check[front] + weight
                }

            }
            q.removeFirst()
            print(check)
        }
    }
    
    return check.filter {
        return $0 <= k
    }.count
}



solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)
solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)
