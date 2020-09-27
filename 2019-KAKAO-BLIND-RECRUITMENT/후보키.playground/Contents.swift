import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    var count = 0
    
    var keyArr: [Int] = []
    var keys: [[Int]] = []
    for i in 0..<relation[0].count {
        var s = Set<String>(
            relation.map({ (arr) -> String in
                return arr[i]
                }
            )
        )
        
        if s.count != relation.count {
            keyArr.append(i)
        }
        else {
            keys.append([i])
            count += 1
        }
    }
    var col = getCol(keyArr)
        .filter { (arr) -> Bool in
            return arr.count > 1
    }
    
    var min: Int = 10000
    
    col.sort { (ar1, ar2) -> Bool in
        return ar1.count < ar2.count
    }
    
    for c in col {
        var tmp: [[String]] = []
        relation.forEach {
            var ar: [String] = []
            for i in c {
                ar.append($0[i])
            }

            tmp.append(ar)
        }
        var s = Set<[String]>(tmp)
        
        if relation.count == s.count {
            
            if isValidMinimality(find: c, at: keys) {
                keys.append(c)
                min = c.count
                count += 1
            }
            
        }
    }
    
//    print(keys)
    
    return count

}

func isValidMinimality(find: [Int], at: [[Int]]) -> Bool {
    var cols = getCol(find)
    var answer = true
    for c in cols {
        if at.contains(c) {
            answer = false
            break
        }
    }
    
    return answer
}

func getCol(_ arr: [Int]) -> [[Int]] {
    if arr.count == 0 {
        return []
    }
    
    var times = pow(2.0, Double(arr.count))
    
    var answer: [[Int]] = [[arr[0]], []]
    
    func rec(count: Int)  {
        if count >= arr.count {
            return
        }
        
        var tmp = answer
        
        for i in 0..<tmp.count {
            tmp[i].append(arr[count])
        }
        
        answer.append(contentsOf: tmp)
    }
    
    for i in 1..<arr.count {
        rec(count: i)
    }

    
    return answer
        
}

solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])
//solution([["100"],["200"],["300"],["400"],["500"],["600"]])




