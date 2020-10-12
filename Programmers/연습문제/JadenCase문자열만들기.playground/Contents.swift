import Foundation

func solution(_ s:String) -> String {
    
    var arr = s.components(separatedBy: " ")
    
    var answer = ""
    for a in arr {
        if a != arr.first {
            answer += " "
        }
        answer += makeFirstCharToUpperCase(a)
    }
    return answer
}

func makeFirstCharToUpperCase(_ s: String) -> String {
    
    return s.enumerated().compactMap { (i, c) -> String in
        if i == 0 {
            return "\(c.uppercased())"
        }
        else {
            return "\(c.lowercased())"
        }
    }.reduce("", { (result, s) -> String in
        result + s
    })
}


solution("3people unFollowed me")
solution("for the      last      week")

solution("Hello     friend")
solution("m")
solution(" mmmm")
