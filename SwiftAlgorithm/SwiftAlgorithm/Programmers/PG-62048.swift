//
//  PG-62048.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/21.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    
    // 최소 공배수를 구하는 함수
    func gcd(_ n1: Int, _ n2: Int) -> Int {
        
        if n2 == 0 {
            return n1
        }
        
        return gcd(n2, n1 % n2)
    }
    let gNum = w > h ? gcd(w, h) : gcd(h, w)
    
    
    
    // 영향을 받는 사각형의 패턴을 찾아서 적용
    // 패턴의 원리는 아래에 ..!
    // https://taesan94.tistory.com/55
    answer = Int64(w * h - (w + h - gNum))

    return answer
}



