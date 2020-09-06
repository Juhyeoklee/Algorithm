import Foundation

func solution(_ s:String) -> Int {
    
    var arr = Array(s)
    var answer = 99999999
    
    if s.count == 1 {
        return 1
    }
    
    for i in 1...(s.count/2) {
        var start = 0
        var end = i
        var cut: [String] = []
        while true {
            
            var s = ""
            for i in start..<end {
                s.append(arr[i])
            }
            cut.append(s)
            
            start = end
            end += i
            
            if end >= arr.count {
                end = arr.count
            }
            
            if start >= arr.count {
                break
            }
        }
        
        var begin = 0
        var wordCount = 0
        var resultString = ""
        
        for (i, s) in cut.enumerated() {
            
            if cut[begin] == s {
                wordCount += 1
                
                if i == cut.count - 1 {
                    if wordCount == 1 {
                        resultString.append(cut[begin])
                        
                    }
                    else {
                        resultString.append("\(wordCount)\(cut[begin])")
                    }
                    
                }
            }
            else {
                if wordCount == 1 {
                    resultString.append(cut[begin])
                }
                else {
                    resultString.append("\(wordCount)\(cut[begin])")
                }
                
                
                if i == cut.count - 1 {
                    resultString.append(s)
                }
                wordCount = 1
                begin = i
            }
        }
        
        if answer > resultString.count {
            answer = resultString.count
        }
    }
    
    return answer
}
