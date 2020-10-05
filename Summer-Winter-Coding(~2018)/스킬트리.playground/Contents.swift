import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var answer = skill_trees.count
    
    for t in skill_trees {
        var a = Array(skill)
        var ar = t.filter { a.contains($0)}
        
        while !ar.isEmpty {
            if a.first == ar.first {
                a.removeFirst()
                ar.removeFirst()
            }
            else {
                answer -= 1
                break
            }
        }
    }
    
    return answer
}



solution("CBD", ["BACDE", "CBADF", "AECB", "BDA", "CEFD"])
solution("CBD",  ["BACDE", "CBADF", "AECB", "BDA", "AQWER"])
solution("ABC", ["OPQ"])

