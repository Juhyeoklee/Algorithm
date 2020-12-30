//
//  PG-17680.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/12/30.
//

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    // cities 배열을 대문자로 바꾼다.
    var tmp = cities.map{ return $0.uppercased() }
    
    // 캐시로 저장될 문자열을 저장
    var caches: [String] = []
    var count = 0
    
    for c in tmp {
        // 캐시안에 있으면
        if caches.contains(c) {
            // 원래 캐시안에있던 검색어를 지우거
            // 해당 검색어를 캐시에 다시 집어놓는다.
            // LRU : 가장 오래전에 사용된 캐시 먼저 지우는 알고리즘
            caches = caches.filter { return $0 != c }
            caches.append(c)
            count += 1
        }
        else {
            // 캐시안에 없으면 캐시에서 가장 오래된 첫번째 인덱스값만 지운뒤
            // 캐시에 해당 검색어를 업데이트
            caches.append(c)
            if caches.count > cacheSize {
                caches.removeFirst()
            }
            count += 5
        }
    }
    return count
}
