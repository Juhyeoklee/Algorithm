//
//  PG-12985.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/02.
//

import Foundation
// n : 게임 참가자 수
// a : 참가자 번호
// b : 경쟁자 번호
func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var tmpA: Double = Double(a)
    var tmpB: Double = Double(b)
    var count = 1
    tmpA = ceil(tmpA / 2)
    tmpB = ceil(tmpB / 2)
    
    // 다음 라운드로 진출할 때 번호는
    // 현재 번호 / 2 의 올림 값이 되므로
    // 경쟁자의 번호와 자신의 번호를 계속 구해 비교 한다.ㅇ
    while tmpA != tmpB {
        tmpA = ceil(tmpA / 2)
        tmpB = ceil(tmpB / 2)
        count += 1
    }
    
    return count
}
