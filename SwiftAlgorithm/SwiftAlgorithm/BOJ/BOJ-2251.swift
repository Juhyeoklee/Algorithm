//
//  BOJ-2251.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/26.
//


func solution() {
    let input = readLine()!.split(separator: " ").map{ return Int($0)! }
    let A = input[0]
    let B = input[1]
    let C = input[2]

    // A와 B의 현재 물통안에 있는 수를 체크하는 배열
    var check: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: B + 1), count: A + 1)
    var queue: [(Int, Int)] = [(0, 0)]
    var answer: Set<Int> = Set<Int>()
    check[0][0] = true
    answer.insert(C)
    
    func checkArr(_ na: Int, _ nb: Int, _ nc: Int) {
        if !check[na][nb] {
            check[na][nb] = true
            queue.append((na, nb))
            if na == 0 {
                answer.insert(nc)
            }
        }
    }
    
    // bfs
    while !queue.isEmpty {
        if let first = queue.first {
            let a = first.0     // a
            let b = first.1     // b
            let c = C - a - b   // c
            
            var na = a
            var nb = b
            var nc = c
            // 물통을 넘기는 경우의 수를 모두 체크한다.
            // a -> b
            nb += na
            na = 0
            if nb > B {
                na = nb - B
                nb = B
            }
            checkArr(na, nb, nc)
            
            // a -> c
            na = a
            nb = b
            nc = c
            
            nc += na
            na = 0
            if nc > C {
                na = nc - C
                nc = C
            }
            checkArr(na, nb, nc)
            
            // b -> a
            na = a
            nb = b
            nc = c
            
            na += nb
            nb = 0
            if na > A {
                nb = na - A
                na = A
            }
            checkArr(na, nb, nc)
            
            // b -> c
            na = a
            nb = b
            nc = c
            
            nc += nb
            nb = 0
            if nc > C {
                nb = nc - C
                nc = C
            }
            checkArr(na, nb, nc)
            
            // c -> a
            na = a
            nb = b
            nc = c
            
            na += nc
            nc = 0
            if na > A {
                nc = na - A
                na = A
            }
            checkArr(na, nb, nc)
            
            // c -> b
            na = a
            nb = b
            nc = c
            
            nb += nc
            nc = 0
            if nb > B {
                nc = nb - B
                nb = B
            }
            checkArr(na, nb, nc)
            queue.removeFirst()
        }
        
    }
    for n in answer.sorted() {
        print(n, terminator: " ")
    }
    print()
}
