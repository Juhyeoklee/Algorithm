import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    
    var count: Int = 0
    var min = stones.min()!
    var max = stones.max()!
    var mid = 0
    
    while min < max {
        mid = (min + max) / 2
        
        if checkArr(arr: stones, n: mid, k: k) {
            min = mid + 1
            count = mid
        }
        else {
            max = mid - 1
        }
    }
    
    
    return count
}


func checkArr(arr: [Int], n: Int ,k: Int) -> Bool {
    var count = 0
    let tmp = arr.map{ return $0 - (n - 1) }
    for t in tmp {
        if t <= 0 {
            count += 1
        }
        else {
            count = 0
        }
        
        if count >= k {
            return false
        }
    }
    
    return true
}


solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3)

