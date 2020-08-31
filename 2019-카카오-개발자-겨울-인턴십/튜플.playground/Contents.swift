
import Foundation

func solution(_ s:String) -> [Int] {
    var dic: [String: Int] = [:]
    var ans = s.components(separatedBy: ["{", "}", ","]).filter{
        return $0.count != 0
    }
    .forEach {
        if let v = dic[$0] {
            dic.updateValue(v + 1, forKey: $0)
        }
        else {
            dic.updateValue(1, forKey: $0)
        }
    }

    return dic.sorted { (d1, d2) in
        return d1.value > d2.value
    }.map { t in
        return Int(t.key)!
    }
}