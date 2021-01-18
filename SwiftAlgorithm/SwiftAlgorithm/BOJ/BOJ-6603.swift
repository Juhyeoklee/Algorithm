//
//  BOJ-6603.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/17.
//

func find(_ tmpArr: [Int]) {
    var answer: [[Bool]] = []
    
    // 경우의 수를 체크하기 위해 재귀함수 사용
    // 주어진 배열에서 6개의 수를 체크
    func recur(_ check: [Bool]) {
        
        if check.count == tmpArr.count {
            if check.filter({ return $0 }).count == 6 {
                answer.append(check)
                
            }
            return
        }
        recur(check + [true])
        recur(check + [false])
    }
    
    recur([true])
    recur([false])
    
    // 경우의수를 바탕으로 수를 뽑아낸다.
    for a in answer {
        
        for (i, b) in a.enumerated() {
            if b {
                if i == a.count - 1 {
                    print(tmpArr[i], terminator: "")
                }
                else {
                    print(tmpArr[i], terminator: " ")
                }
                
            }
        }
        print()
    }
}


func solution() {
    while true {
        let arr = readLine()!.split(separator: " ").map { return Int($0)! }
        let k = arr[0]
        if k == 0 {
            break
        }
        
        let s = arr[1...k].map{ return $0 }
        // 주어진 배열로 경우의 수 찾기
        find(s)
        print()
    }
}
