//
//  BOJ-5014.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/27.
//

func solution() {
    let input = readLine()!.split(separator: " ").map{ return Int($0)! }

    let F = input[0] // 총 층수
    let S = input[1] // 현재 위치
    let G = input[2] // 갈 층
    let U = input[3] // 위로 U 만큼 가는 버튼
    let D = input[4] // 아래로 D 만큼 가는 버튼
    
    var check: [Int] = [Int](repeating: -1, count: F + 1)
    check[S] = 0
    var queue: [Int] = [S]
    
    while !queue.isEmpty {
        if let first = queue.first {
            let cur = check[first]
            var next = first
            next += U
            if next <= F, check[next] < 0 {
                queue.append(next)
                check[next] = cur + 1
                
            }
            
            next = first
            next -= D
            if next > 0, check[next] < 0 {
                queue.append(next)
                check[next] = cur + 1
            }
            
            queue.removeFirst()
        }
    }
    
    print(check[G] >= 0 ? check[G] : "use the stairs")

}
