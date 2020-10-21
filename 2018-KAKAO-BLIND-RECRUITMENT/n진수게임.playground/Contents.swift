import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let num = t * m

    var answer = ""
    var count = 0
    var turn = 1
    
    for i in 0...num {
        let tmpNum = makeNum(i, n: n)
        
        for c in tmpNum {
            if turn == p && count < t {
                answer += "\(c)"
                count += 1
            }
            if turn == m {
                turn = 0
            }
            turn += 1
        }
    }
    
    
    return answer
}



func makeNum(_ number: Int, n: Int) -> String {
    // n : 진법
    
    if number == 0 {
        return "\(0)"
    }
    var tmp = number
    var ans = ""
    let data = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    while tmp != 0 {
        let rst = tmp % n
        
        ans = data[rst] + ans
        tmp = tmp / n
    }
    return ans
}


solution(2, 4, 2, 1)
solution(16, 16, 2, 1)
solution(16, 1000, 100, 99)



