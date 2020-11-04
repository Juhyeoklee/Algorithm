//
//  BOJ17413.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/04.
//

import Foundation

struct BOJ17413 {
    // 단어 뒤집기 2
    static var str: String = ""
    static var isOpenParentheses: Bool = false
    static var flipStr: [String] = []
    
    static func main() {
        str = readLine()!
        var tmp = ""
        for c in str {
            if c == "<" {
                isOpenParentheses = true
                
                if tmp.count > 0 {
                    flipStr.append(tmp)
                    tmp = ""
                }
                tmp += "<"
            }
            else if c == ">" {
                isOpenParentheses = false
                tmp += ">"
                flipStr.append(tmp)
                tmp = ""
            }
            else if c == " " {

                if !isOpenParentheses {
                    flipStr.append(tmp)
                    flipStr.append(" ")
                    tmp = ""
                }
                else {
                    tmp += " "
                }
            }
            else {
                    tmp += "\(c)"
            }
        }
        if tmp.count > 0 {
            flipStr.append(tmp)
        }
        
        for r in flipStr {
            if r.contains("<") {
                print(r, terminator: "")
            }
            else {
                print(String(r.reversed()), terminator: "")
            }
        }
        print()
    }
}
BOJ17413.main()

