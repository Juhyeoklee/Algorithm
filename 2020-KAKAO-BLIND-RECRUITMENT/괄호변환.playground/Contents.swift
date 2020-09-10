import Foundation

func solution(_ p:String) -> String {
    
    var arr = Array(p).map{ return "\($0)" }
    
    
    if isCorrected(arr) {
        return p
    }
    
    
    return recursive(arr)
}


func recursive(_ p: [String]) -> String {
    
    if p.count == 0 {
        return ""
    }
    
    var u: [String] = []
    var v: [String] = []
    var lp: Int = 0
    var rp: Int = 0
    
    u.append(p[0])
    
    if p[0] == "(" {
        lp += 1
    }
    else {
        rp += 1
    }
    
    for (i, pEntity) in p.enumerated() {
        
        if i == 0 {
            continue
        }
        
        if rp != lp {
            if pEntity == "(" {
                lp += 1
                u.append(pEntity)
            }
            else {
                rp += 1
                u.append(pEntity)
            }
        }
        else {
            v.append(pEntity)
        }
    }
    
    let new = recursive(v)
    var answer = ""
    
    if !isCorrected(u) {
        let first = u.first
        let last = u.last
        u.removeFirst()
        u.removeLast()
        
        for i in 0..<u.count {
            if u[i] == "(" {
                u[i] = ")"
            }
            else {
                u[i] = "("
            }
        }
        
        answer += "("
        answer += new
        answer += ")"
        
        for e in u {
            answer += e
        }
        return answer
    }
    else {
        for e in u {
            answer += e
        }
        return answer + new
    }
    
    
}

func isCorrected(_ p: [String]) -> Bool {
    
    var s: [String] = []
    var flag: Bool = true
    
    for entity in p {
        if entity == "(" {
            s.append(entity)
        }
        else {
            if s.isEmpty {
                flag = false
                break
            }
            else {
                s.removeLast()
            }
        }
    }
    
    if s.count != 0 {
        flag = false
    }
    return flag
}


solution("()))((()")
solution(")(")
solution("(()())()")
