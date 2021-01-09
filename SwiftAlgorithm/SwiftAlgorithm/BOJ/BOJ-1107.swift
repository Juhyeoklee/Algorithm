//
//  BOJ-1107.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/10.
//

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var check = [Bool](repeating: false, count: 10)
if M > 0 {
    readLine()!.split(separator: " ").map{ return Int($0)! }.forEach {
        check[$0] = true
    }

}

func solution() {
    // 디폴트 채널 번호인 100 번에서 단순 움직임을 계산했을 때를 최소 개수로 잡는다.
    var least = abs(N - 100)
    
    // 가능한 채널을 모두 검사
    for channel in 0...1_000_000 {
        
        let tmp = "\(channel)".map { return Int("\($0)")! }
        var isSelect = true
        
        // 선택할 수 있는 번호인지 체크
        for num in tmp {
            if check[num] {
                isSelect = false
                break
            }
        }
        
        if isSelect {
            // 움직임 수를 계산하여 최소값을 구한다.
            let moveCount = abs(N - channel) + "\(channel)".count
            
            if least > moveCount {
                least = moveCount
            }
        }
    }
    
    print(least)
}

solution()
