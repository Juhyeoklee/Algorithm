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
    let hasArr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
    let _ = Int(readLine()!)!
    let giveArr = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for num in giveArr {
        print(bSearch(arr: hasArr, target: num) ? "1" : "0", terminator: " ")
    }
    print()
}
