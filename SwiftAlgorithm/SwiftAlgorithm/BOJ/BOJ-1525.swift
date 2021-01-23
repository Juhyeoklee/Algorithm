//
//  BOJ-1525.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/23.
//

func down(_ n: String) -> String {
    
    var arr = n.map { return "\($0)"}
    for i in 0..<9 {
        if arr[i] == "0" {
            if ![0, 1, 2].contains(i) {
                arr.swapAt(i, i - 3)
            }
            else {
                return ""
            }
            break
        }
    }
    
    return arr.reduce("", +)
}

func left(_ n: String) -> String {
    var arr = n.map { return "\($0)"}
    
    for i in 0..<9 {
        if arr[i] == "0" {
            if ![0, 3, 6].contains(i) {
                arr.swapAt(i, i - 1)
            }
            else {
                return ""
            }
            break
        }
    }
    
    return arr.reduce("", +)
}

func right(_ n: String) -> String {
    var arr = n.map { return "\($0)"}
    
    for i in 0..<9 {
        if arr[i] == "0" {
            if ![2, 5, 8].contains(i) {
                arr.swapAt(i, i + 1)
            }
            else {
                return ""
            }
            break
        }
    }
    
    return arr.reduce("", +)
}

func up(_ n: String) -> String {
    var arr = n.map { return "\($0)"}
    
    for i in 0..<9 {
        if arr[i] == "0" {
            if ![6, 7, 8].contains(i) {
                arr.swapAt(i, i + 3)
            }
            else {
                return ""
            }
            break
        }
    }
    
    return arr.reduce("", +)
}



func solution() {
    var map = ""
    for _ in 0..<3 {
        map += readLine()!.split(separator: " ").map{ return "\($0)" }.reduce("", +)
    }
    
    var check: [String:Int] = [:]
    var queue: [String] = [map]
    check.updateValue(0, forKey: map)
    
    while !queue.isEmpty {
        if let first = queue.first {

            if first == "123456780" {
                break
            }
            
            let cost = check[first]!
            var next = up(first)
            if next.count != 0 {
                
                if let _ = check[next] {
                    
                }
                else {
                    check.updateValue(cost + 1, forKey: next)
                    queue.append(next)
                }
                
            }
            
            next = down(first)
            if next.count != 0 {
                if let _ = check[next] {
                    
                }
                else {
                    check.updateValue(cost + 1, forKey: next)
                    queue.append(next)
                }
            }
            
            next = left(first)
            if next.count != 0 {
                if let _ = check[next] {
                    
                }
                else {
                    check.updateValue(cost + 1, forKey: next)
                    queue.append(next)
                }
            }
            next = right(first)
            if next.count != 0 {
                if let _ = check[next] {
                    
                }
                else {
                    check.updateValue(cost + 1, forKey: next)
                    queue.append(next)
                }
            }
            
            queue.removeFirst()
        }
    }
    print( check["123456780"] ?? -1)
    
}

solution()


//1 2 3
//4 0 5
//7 8 6

//6 4 7
//8 5 0
//3 2 1
