//
//  BOJ-1963.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/21.
//

func solution() {
    var T = Int(readLine()!)!
    
    // 소수인지 판단하는 함수
    func judgePrime(_ num: Int) -> Bool {
        
        
        var i = 2
        
        while i * i < num {
            if num % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
    
    
    
    while T != 0 {
        let nums = readLine()!.split(separator: " ").map{ return Int($0)! }
        
        
        func findSol(_ num1: Int, _ num2: Int) {
            // BFS
            var check: [Int] = [Int](repeating: Int.max, count: 10_000)
            var queue: [Int] = [num1]
            check[num1] = 0
            
            if num1 == num2 {
                print(check[num2])
                return
            }
            
            while !queue.isEmpty {
                if let first = queue.first {
                    
                    let cnt = check[first]
                    let arr1 = "\(first)".map{ return Int("\($0)")! }
                    // 각 자리수에 0부터 9까지 바꿔가면서 넣어준다.
                    for i in 0..<4 {
                        
                        for j in 0..<10 {
                            var tmp = arr1
                            
                            if j == tmp[i] {
                                continue
                            }
                            
                            if i == 0 {
                                if j != 0 {
                                    tmp[i] = j
                                }
                            }
                            else if i == 3 {
                                if j % 2 != 0 {
                                    tmp[i] = j
                                }
                            }
                            else {
                                tmp[i] = j
                            }
                            let tmpNum = Int(tmp.map{ return "\($0)" }.reduce("", +))!
                            // 바꿔준 수가 소수이고, 체크 배열수와 비교하여 최소 시 큐에 삽입
                            if judgePrime(tmpNum) {
                                if check[tmpNum] > cnt + 1 {
                                    
                                    check[tmpNum] = cnt + 1
                                    queue.append(tmpNum)
                                }
                            }
                            
                        }
                    }
                    queue.removeFirst()
                }
                
            }
            if check[num2] != Int.max {
                print(check[num2])
            }
            else {
                print("Impossible")
            }
            
        }
        
        findSol(nums[0], nums[1])
        
        T -= 1
    }
}


solution()
