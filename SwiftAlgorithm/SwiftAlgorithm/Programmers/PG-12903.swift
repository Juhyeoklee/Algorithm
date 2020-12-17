//
//  PG-12903.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/17.
//

func solution(_ s:String) -> String {
    
    // s 가 빈 문자열일 때 에러 처리
    if s.count == 0 {
        return ""
    }
    
    // s의 길이가 짝수일 때
    if s.count % 2 == 0 {
        return "\(s[s.index(s.startIndex, offsetBy: s.count / 2 - 1)...s.index(s.startIndex, offsetBy: s.count / 2)])"
    }
    
    // s의 길이가 홀수일 때
    return "\(s[s.index(s.startIndex, offsetBy: s.count / 2)])"
}
