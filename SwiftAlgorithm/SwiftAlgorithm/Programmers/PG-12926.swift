//
//  PG-12926.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/01/06.
//

import Foundation

extension UInt8 {
    // 아스키 코드를 string으로 바꿔주는 extenion
    func asciiCodeToString() -> String {
        return String(UnicodeScalar(self))
    }
}

func solution(_ s:String, _ n:Int) -> String {
    return s.map { c -> String in
        
        var code = c.asciiValue!
        // 아스키 코드 값을 구한다.
        switch code {
        // code 값을 계산에 맞게 변경시킨다.
        case 65...90:
            code = (code + UInt8(n) - 65) % 26 + 65
        case 97...122:
            code = (code + UInt8(n) - 97) % 26 + 97
        default:
            break
        }
        // 해당 code 값을 String으로 변환하여 리턴
        return code.asciiCodeToString()
        // join() 메소드, 배열을 string으로 연결하는 것
    }.joined()
}
