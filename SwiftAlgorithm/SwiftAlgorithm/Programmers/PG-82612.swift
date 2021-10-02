//
//  PG-82612.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/08/08.
//

import Foundation

func solution_82612(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalPrice: Int64 = (1...count).reduce(0) { partialResult, add in
        return Int64(partialResult + Int64(add * price))
    }
    
    return totalPrice > money ? totalPrice - Int64(money) : 0
}
