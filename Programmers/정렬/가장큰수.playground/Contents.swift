import Foundation

func solution(_ numbers:[Int]) -> String {
    var answer = ""
    var sArr = numbers.sorted { (s1, s2) -> Bool in
        return Int("\(s1)\(s2)")! > Int("\(s2)\(s1)")!
    }
    
    if sArr[0] == 0 {
        return "0"
    }
    
    return sArr.reduce("") { (result, num) -> String in
        return result + "\(num)"
    }
}


//solution([6, 10, 2])
solution([3, 30, 34, 5, 9])

//solution([0,0,0,1000])
//solution([3, 30, 34, 5, 191, 432789])

