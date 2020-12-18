//
//  약수구하기.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/18.
//

let input = readLine()!

func 약수구하기(_ input: String) {
    var num = Int(input)!
    var count = 1
    // 중복 배제하기 위해 Set 사용
    var answer: Set<Int> = []
    // 1 부터 나누어 떨어지는 수를 구한다.
    while true {
        if num % count == 0 {
            // 이미 존재하는 수가 나온경우 그만 둔다.
            if answer.contains(count) {
                break
            }
            
            answer.insert(count)
            answer.insert(num / count)
        }
        count += 1
    }

    for n in answer.sorted() {
        print(n, terminator: " ")
    }
    print()

}

