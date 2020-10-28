import Foundation

func solution(_ n:Int) -> Int {
    return makeThreeToTenNum(makeTenToThreeNum(n))
}

func makeTenToThreeNum(_ n: Int) -> String {
    
    var tmp = n
    var answer = ""
    
    while tmp != 0 {
        answer = "\(tmp % 3)" + answer
        tmp = tmp / 3
    }
    return answer
}

func makeThreeToTenNum(_ n: String) -> Int {
    var index = 0.0
    var answer = 0
    for c in n {
        let num = Int("\(c)")! * Int(pow(3.0, index))
        
        answer += num
        index += 1.0
    }
    
    return answer
}

solution(45)
solution(125)

