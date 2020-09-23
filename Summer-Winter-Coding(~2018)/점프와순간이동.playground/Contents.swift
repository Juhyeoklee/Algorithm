import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 1
    var num = Double(n)

    
    
    while num != 1 {
        if num / 2 != floor(num / 2) {
            ans += 1
        }
        
        num = floor(num / 2)
    }
//
//    func dp(num: Int) -> Int {
//        if arr[num] >= 0 {
//            return arr[num]
//        }
//
//        if num % 2 == 0 {
//            arr[num] = dp(num: num / 2)
//        }
//        else {
//            arr[num] = dp(num: num - 1) + 1
//        }
//
//        return arr[num]
//    }
//    ans = dp(num: n)

    return ans
}

solution(50000)
solution(5)
solution(6)
