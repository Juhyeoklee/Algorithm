import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var records: [String] = []
    var counts: [Int] = [Int](repeating: 0, count: n)
    var answer: [Int] = []
    
    for (i, w) in words.enumerated() {
        if records.contains(w) {
            answer = [i % n + 1, counts[i % n] + 1]
            break
        }
        else {
            if let last = records.last {
                if last.last == w.first {
                    counts[i % n] += 1
                    records.append(w)
                }
                else {
                    answer = [i % n + 1, counts[i % n] + 1]
                    break
                }
            }
            else {
                counts[i % n] += 1
                records.append(w)
            }
            
        }
    }
    return answer.isEmpty ? [0, 0] : answer
}


solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])

solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])
solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])
