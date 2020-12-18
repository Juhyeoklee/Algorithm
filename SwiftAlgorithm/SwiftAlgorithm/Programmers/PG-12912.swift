//
//  PG-12912.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/19.
//

func solution(_ a:Int, _ b:Int) -> Int64 {
    var sum = 0
    let c = a + b
    var small = 0
    var big = 0
    
    if a > b {
        big = a
        small = b
    }
    else {
        big = b
        small = a
    }
    // 그냥 더하면 시간이 많이 걸린다.
    // 처음 수와 마지막 수의 합을 곱하는 방식으로 더해주면 빠르게 풀 수 있다.
    sum += c * Int((big - small + 1) / 2)
    if (big - small + 1) % 2 != 0 {
        sum += (big + small) / 2
    }
    return Int64(sum)
}
