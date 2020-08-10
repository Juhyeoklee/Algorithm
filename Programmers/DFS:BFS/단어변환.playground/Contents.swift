import Foundation

var check: [String: Int] = [:]
var arr: [String: [String]] = [:]
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    check.updateValue(-1, forKey: begin)
    arr.updateValue([], forKey: begin)
    for word in words {
        check.updateValue(-1, forKey: word)
        arr.updateValue([], forKey: word)
    }
    
    for (key, _) in arr {
        var value = arr[key]
        
        for word in words {
            var difCount = 0
            for i in 0..<key.count {
                var keyChar = key[key.index(key.startIndex, offsetBy: i)]
                var wordChar = word[word.index(word.startIndex, offsetBy: i)]
     
                if keyChar != wordChar {
                    difCount += 1
                }
            }
            if difCount == 1 {
                arr[key]!.append(word)
            }

        }
    }
    bfs(start: begin)

    return check[target] ?? 0
}

func bfs(start: String){
    
    var q: [String] = []
    q.append(start)
    check[start] = 0
    
    while !q.isEmpty {
        if let front = q.first {
            q.removeFirst()
            var count = check[front]
            for des in arr[front]!{
                if check[des]! < 0 {
                    q.append(des)
                    check[des] = count! + 1
                }
            }
        }
    }
}

solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
//solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
