import Foundation

func solution(_ expression:String) -> Int64 {
    
    var ex = expression
    var nums = expression.components(separatedBy: ["-", "*", "+"])
    
    var opers = expression.compactMap { (c) -> String in
        if ["-", "*", "+"].contains("\(c)") {
            return "\(c)"
        }
        else {
            return ""
        }
    }.filter {
        return $0.count != 0
    }
    
    var result : [Int64] = []
    result.append(contentsOf: [
        doOper(exp: nums, opers: opers, opersOrder: ["+", "*", "-"]),
        doOper(exp: nums, opers: opers, opersOrder: ["+", "-", "*"]),
        doOper(exp: nums, opers: opers, opersOrder: ["*", "+", "-"]),
        doOper(exp: nums, opers: opers, opersOrder: ["*", "-", "+"]),
        doOper(exp: nums, opers: opers, opersOrder: ["-", "*", "+"]),
        doOper(exp: nums, opers: opers, opersOrder: ["-", "+", "*"])
    ])
    
    return result.max()!
}

func doOper(exp: [String],opers: [String], opersOrder: [String]) -> Int64 {
    var answer: Int64 = 0
    var tmpExp = exp
    var tmpOpers = opers
    
    for op in opersOrder {
        
        operate(exps: &tmpExp, opers: &tmpOpers, first: op)
    }
    answer = Int64(tmpExp[0])!
    
    if answer < 0 {
        answer = -answer
    }
    return answer
}

func operate(exps: inout [String], opers: inout [String], first: String) {
    
    if !opers.contains(first) {
        return
    }
    for (i, o) in opers.enumerated() {
        print(i, o)
        if o == first {
            
            var a = Int(exps[i])
            var b = Int(exps[i + 1])
            var result = op(lhs: a!, rhs: b!, oper: o)
            exps.remove(at: i + 1)
            exps.remove(at: i)
            opers.remove(at: i)
            
            exps.insert("\(result)", at: i)
            break
        }
    }
    
    operate(exps: &exps, opers: &opers, first: first)
}

func op(lhs: Int, rhs: Int, oper: String) -> Int {
    switch oper {
    case "+":
        return lhs + rhs
    case "-":
        return lhs - rhs
    case "*":
        return lhs * rhs
    default:
        return 0
    }
}

solution("100-200*300-500+20")
