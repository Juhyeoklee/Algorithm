//
//  PG-67258.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2021/03/09.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    
    // 전체 보석의 종류
    let gemCount = Set<String>(gems).count
    
    // 범위안에 있는 보석을 저장
    // (0,0) 범위에서 시작을 하기 때문에 초기값을 설정한다.
    var dic: [String:Int] = [gems[0]:1]
    // 최적의 양쪽 포인터를 저장하는 변수
    // 초기값은 최대 범위로 지정
    var answer = (start: 0, end: gems.count - 1)
    
    // gems 배열을 순회할 양쪽 포인터
    var lPoint = 0
    var rPoint = 0
    while (lPoint < gems.count) && (rPoint < gems.count) {
        
        let count = dic.count
        // 범위안에 있는 보석의 종류 수 와 전체 보석의 종류수가 같을 때
        if count == gemCount {
            
            // 현재 포인터가 가리키는 범위의 길이와 answer 변수에 저장된 양쪽 포인터의 범위의 길이를 비교
            // 더 짧은 범위 값으로 answer 변수를 업데이트 한다.
            if rPoint - lPoint < answer.end - answer.start {
                answer.start = lPoint
                answer.end = rPoint
            }
            // 두 값이 같은 경우에는 왼쪽 포인터의 값이 작을 때
            // answer 변수를 업데이트
            else if rPoint - lPoint == answer.end - answer.start {
                if lPoint < answer.start {
                    answer.start = lPoint
                    answer.end = rPoint
                }
            }
            
            if let value = dic[gems[lPoint]] {
                // lPoint에 해당하는 보석의 빈도 수가 한개일 경우
                if value - 1 == 0 {
                    // dictionary 에서 삭제
                    dic.removeValue(forKey: gems[lPoint])
                }
                // 그렇지 않은 경우
                else {
                    // value 값을 감소시켜 준다.
                    dic.updateValue(value - 1, forKey: gems[lPoint])
                }
            }
            // lPoint 위치를 한칸 증가 시킨다.
            lPoint += 1
        }
        // 그렇지 않을 경우
        else {
            // rPoint 위치를 한칸 증가 시키고
            rPoint += 1
            // rPoint가 gems의 배열 범위를 벗아나게 되면 그대로 진행
            if rPoint >= gems.count {
                continue
            }
            // rPoint에 해당하는 보석의 빈도 수를 업데이트
            if let value = dic[gems[rPoint]] {
                dic.updateValue(value + 1, forKey: gems[rPoint])
            }
            else {
                dic.updateValue(1, forKey: gems[rPoint])
            }
        }
    }
    return [answer.start + 1, answer.end + 1]
}
