//
//  BOJ-10815.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/13.
//


func bSearch(arr: [Int], target: Int) -> Bool {
    var lPoint = 0
    var rPoint = arr.count - 1
    
    while lPoint <= rPoint {
        let mid = (lPoint + rPoint) / 2
        if arr[mid] == target {
            return true
        }
        else if arr[mid] > target {
            rPoint = mid - 1
        }
        else {
            lPoint = mid + 1
        }
    }
    
    return false
}

func solution() {
    let _ = Int(readLine()!)!
    // 이분탐색에 있어서 중요한 점은 탐색을 위한 배열이 필수적으로 정렬이 되어있어야 한다는 점
    let hasArr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
    let _ = Int(readLine()!)!
    let giveArr = readLine()!.split(separator: " ").map{ Int($0)! }
    
    // 찾아야하는 숫자가 들어있는 뱅
    for num in giveArr {
        print(bSearch(arr: hasArr, target: num) ? "1" : "0", terminator: " ")
    }
    print()
}
