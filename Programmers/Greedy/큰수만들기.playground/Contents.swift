import Foundation

func solution(_ number:String, _ k:Int) -> String {

    var numArr: [String] = []
    var removeNumArr: [String] = []

    for s in number {
        if numArr.isEmpty {
            numArr.append("\(s)")
            continue
        }
        
        while !numArr.isEmpty && removeNumArr.count != k && numArr.last! < "\(s)" {
            removeNumArr.append(numArr.last!)
            numArr.removeLast()
        }
        numArr.append("\(s)")
        
    }
    var answer: String = ""
    
    if removeNumArr.isEmpty {
        answer = "\(number.prefix(upTo: number.index(number.startIndex, offsetBy: number.count - k)))"
    }
    else {
        answer = numArr.reduce("") { (result, new)->String in
            return result + "\(new)"
        }
    }
    return answer
}
