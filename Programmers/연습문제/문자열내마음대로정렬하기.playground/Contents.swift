import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {

    return strings.sorted { (s1, s2) -> Bool in
        let a = s1[s1.index(s1.startIndex, offsetBy: n)]
        let b = s2[s2.index(s2.startIndex, offsetBy: n)]
        if a == b {
            return s1 < s2
        }
        
        return a < b
    }
}

//func sort(_ standards: [])

solution(["sun", "bed", "car"], 1)
solution(["abce", "abcd", "cdx"], 2)

