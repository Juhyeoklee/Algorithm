//
//  PG-17676.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/24.
//

func solution(_ lines:[String]) -> Int {
    // i 초에서 1초동안 처리하는 개수를 저장하는 배열이다.
    var arr = [Int](repeating: 0, count: 86_400_000)
    var max = 0
    
    for l in lines {
        // 주어진 입력 값을 초단위 로 변경
        let splitL = l.split(separator: " ").map { "\($0)"}
        var tmp = splitL[2]
        tmp.removeLast()
        let duringTime = Int(Double(tmp)! * 1000)
        
        
        let endTime = convertMiliSecond(splitL[1])
        var start = endTime - duringTime + 1 - 999
        
        if start < 0 {
            start = 0
        }
        
        // 해당 초에 처리하는 개수를 추가하고 max 값을 계산한다.
        for i in start...endTime{
            if max <= arr[i] + 1 {
                max = arr[i] + 1
            }
            arr[i] += 1
        }
    }
    return max
}

func convertMiliSecond(_ time: String) -> Int {
    let splitT = time.split(separator: ":")
    
    let h = Int(splitT[0])! * 3600 * 1000
    let m = Int(splitT[1])! * 60 * 1000
    let s = Double(splitT[2])! * 1000

    return h + m + Int(s)
}
