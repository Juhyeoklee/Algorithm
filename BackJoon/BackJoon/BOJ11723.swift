//
//  main.swift
//  BackJoon
//
//  Created by 이주혁 on 2020/11/02.
//

struct BOJ11723 {
    static var s = 0
    static var count = 0
    static var answer: [Int] = []
    static var opers: [String] = []
    
    static func main() {
        
        guard let n = readLine() else {
            return
        }
        
        while count != Int(n)! {
            
            if let line = readLine() {
                opers.append(line)
            }
            count += 1
        }
            
        for o in opers {
            var tmp = o.split(separator: " ").map { return "\($0)" }
            
            switch tmp[0] {
            case "add", "check", "remove", "toggle":
                let num = Int(tmp[1])
                if tmp[0] == "add" {
                    s = s | ( 1 << num! )
                }
                else if tmp[0] == "check" {
                    if (s & (1 << num!)) != 0 {
                        answer.append(1)
                    }
                    else {
                        answer.append(0)
                    }
                }
                else if tmp[0] == "remove" {
                    s = s & ~(1 << num!)
                }
                else {
                    s = s ^ (1 << num!)
                }
            case "all":
                s = (1 << 21) - 1
            case "empty":
                s = 0
            default:
                break
            }
        }
                    
        
        for a in answer {
            print(a)
        }
    }
    
}
BOJ11723.main()
