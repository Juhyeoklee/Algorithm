//
//  PG-12901.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/17.
//

func solution(_ a:Int, _ b:Int) -> String {
    // 각 월의 일 수
    let days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    // 주어진 날짜를 오직 day의 합으로 구하는 방법
    // reduce 문법 주의
//    let count = days[0..<(a-1)].reduce(0) { (result, num) -> Int in
//        return result + num
//    } + b
    
    let count = days[0..<a-1].reduce(0, +) + b
    
    // day의 합에서 지난 날을 구한 뒤 7 로 mod 연산을 하였을 떄
    // 1월 1일이 금요일이기 때문에 0을 금요일로 두고 나머지를 배치한다.
    let answer = [0 : "FRI", 1 : "SAT", 2 : "SUN", 3 : "MON", 4 : "TUE", 5 : "WED", 6 : "THU"]
    
    return answer[(count - 1) % 7]!
}
