import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    var kindCount: Int = Set<String>(gems).count
    var dic: [String:Int] = [gems[0]:1]
    var answer = [0, gems.count - 1]
    
    var start: Int = 0
    var end: Int = 0

    while start < gems.count && end < gems.count {
        if dic.count == kindCount {
            if end - start < answer[1] - answer[0] {
                answer = [start, end]
            }
            if let v = dic[gems[start]] {
                if v == 1 {
                    dic.removeValue(forKey: gems[start])
                }
                else {
                    dic.updateValue(v - 1, forKey: gems[start])
                }
            }
            start += 1
        }
        else {
            end += 1
            if end == gems.count {
                break
            }
            if dic.keys.contains(gems[end]) {
                dic.updateValue(dic[gems[end]]! + 1, forKey: gems[end])
            }
            else {
                dic.updateValue(1, forKey: gems[end])
            }
        }
    }
    return [answer[0] + 1, answer[1] + 1]
}


solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])
solution(["AA", "AB", "AC", "AA", "AC"])
solution(["XYZ", "XYZ", "XYZ"])
//solution(["AA"])
solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])
