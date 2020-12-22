//
//  PG-42860.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/21.
//

import Foundation

func solution(_ name:String) -> Int {
    
    // 각 커서에서 알파벳을 바꿀 때 소요되는 움직임을 계산
    var answer = name.utf16.compactMap { (s) -> Int in
        return min(abs(65 - Int(s)), abs(91 - Int(s)))
    }
    
    // 모두 A를 입력하는 것이라면 아예움직이지 않아도 된다.
    if answer.allSatisfy({ (n) -> Bool in return n == 0 }) {
        return 0
    }
    // 움직인 횟수 계산
    var count = 0
    // 현재 커서 위치 표현
    var curIndex = 0
    
    while true {
        // 현재 커서위치에 알파벳을 변경하는 횟수를 더하고 완료한 경우 0으로 한다.
        count += answer[curIndex]
        answer[curIndex] = 0
        
        // 왼쪽으로 가는게 최선인지, 오른쪽으로 가는게 최선인지 저장하기 위한 변수
        var leftNearIndex = curIndex
        var leftGap = 0
        
        var rightNearIndex = curIndex
        var rightGap = 0
        
        // 모두 변경할시 반복문 종료
        if answer.allSatisfy({ (n) -> Bool in return n == 0 }) {
            break
        }
        
        // 왼쪽으로 이동했을 때 가장 빠르게 만나는 인덱스와 그 곳 까지의 거리
        while true {
            
            leftNearIndex -= 1
            leftGap += 1
            
            if leftNearIndex < 0 {
                leftNearIndex = answer.count - 1
            }
            
            if answer[leftNearIndex] != 0 {
                break
            }
        }
        // 오른쪽으로 이동했을 때 가장 빠르게 만나는 인덱스와 그 곳 까지의 거리
        while true {
            rightNearIndex += 1
            rightGap += 1
            
            if rightNearIndex > answer.count - 1 {
                rightNearIndex = 0
                
            }
            
            if answer[rightNearIndex] != 0 {
                break
            }
        }
        
        
        // 두 사이의 거리중 가까운 곳으로 이동하는 움직임을 더하고
        // 현재 커서를 그곳으로 위치한다.
        if leftGap < rightGap {
            count += leftGap
            curIndex = leftNearIndex
        }
        else {
            count += rightGap
            curIndex = rightNearIndex
        }
    }
    
    return count
    
}
