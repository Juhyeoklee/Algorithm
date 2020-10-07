import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    let MAX_LENGTH = 8
    
    var s: [Set<Int>] = [Set<Int>](repeating: Set<Int>(), count: MAX_LENGTH)

    for i in 0..<s.count {
        s[i].insert(Int(String(repeating: "\(N)", count: i + 1))!)
    }

    for i in 0..<MAX_LENGTH {
        for j in 0..<i {
            for op1 in s[j] {
                for op2 in s[i - j - 1] {
                    s[i].insert(op1 + op2)
                    s[i].insert(op1 * op2)
                    s[i].insert(op1 - op2)
                    if op2 != 0 {
                        s[i].insert(op1 / op2)
                    }
                }
            }
        }
        
        if s[i].contains(number) {
            return i + 1
        }
        
    }
    return -1
}



solution(5, 12)
solution(2, 11)
