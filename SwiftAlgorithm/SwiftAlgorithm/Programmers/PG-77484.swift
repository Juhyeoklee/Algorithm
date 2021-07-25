//
//  PG-77484.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/07/08.
//

import Foundation

func solutionPG77484(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var gradeDic = [
        6: 1,
        5: 2,
        4: 3,
        3: 4,
        2: 5
    ]
    
    let sortedLottos = lottos.sorted().filter { $0 != 0 }
    let deletedNum = lottos.filter { $0 == 0 }.count
    
    return [gradeDic[sortedLottos.filter { win_nums.contains($0) }.count + deletedNum] ?? 6,
            gradeDic[sortedLottos.filter { win_nums.contains($0) }.count] ?? 6]
}



