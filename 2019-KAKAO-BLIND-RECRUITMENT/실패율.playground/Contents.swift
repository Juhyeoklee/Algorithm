import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var check: [Int] = Array(repeating: 0, count: N + 1)
    var s: [Int] = Array(repeating: 0, count: N)
    

    for s in stages {
        for i in 0..<s {
            check[i] += 1
        }
    }

    for i in 0..<(check.count - 1) {
        s[i] = check[i] - check[i + 1]
    }

    var answer: [(Int, Double)] = []
    for (i,c) in s.enumerated() {
        answer.append((i, Double(c) / Double(check[i])))
    }

    return answer.sorted(by: { (t1, t2) -> Bool in
        if t1.1 != t2.1 {
            return t1.1 > t2.1
        }
        else {
            return t1.0 < t2.0
        }
    }).map({ (t) -> Int in
        return t.0 + 1
    })
}


solution(5, [2, 1, 2, 6, 2, 4, 3, 3])
