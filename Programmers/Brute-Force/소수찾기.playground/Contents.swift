import Foundation

func solution(_ numbers:String) -> Int {
    
    var arr = Array(numbers).map { return "\($0)"}
    
    return makeNums(nums: arr)
}


func makeNums(nums: [String]) -> Int {
    var dic: [String: Int] = [:]
    nums.forEach { (s) in
        if dic.keys.contains(s) {
            let v = dic[s]!
            dic.updateValue(v + 1, forKey: s)
        }
        else {
            dic.updateValue(1, forKey: s)
        }
    
    }
    
    let s = makem(num: "", dic: dic, nums: nums)
    var answer = 0
    
    s.forEach {
        if isPrime(num: $0) {
            answer += 1
        }
    }
    return answer
}

func makem(num: String, dic: [String:Int], nums: [String]) -> Set<Int> {

    var tmp = nums
    tmp.append(" ")
    var queue: [String] = []
    queue.append(contentsOf: tmp)
    
    for _ in 1..<nums.count {

        let tmpArr: [String] = queue
        queue.removeAll()
        
        for appendString in tmpArr {
            for s in tmp {
                var count = 0
                appendString.forEach {
                    if "\($0)" == s {
                        count += 1
                    }
                }
                if s != " " {
                    if dic[s]! >= count + 1 {
                        queue.append(appendString + s)
                    }
                }
                else {
                    queue.append(appendString + s)
                }
                
            }
        }
        print(queue)
    }
    let answer = queue.map({ (s) -> String in
        return s.filter {
            return !$0.isWhitespace
        }
    })
    
    return Set<Int>(answer.filter {
        return $0.count != 0
    }.map { (s) -> Int in
        return Int(s)!
    })
    
}

func isPrime(num: Int) -> Bool {
    
    if num == 1 || num == 0 {
        return false
    }
    
    var n = 2
    var answer = true
    
    while n*n < num {
        
        if num % n == 0 {
            answer = false
            break
        }
        
        n += 1
    }
    
    return answer
}

//solution("5111048")
solution("17")

