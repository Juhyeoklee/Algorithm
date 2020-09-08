import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var lh: (x: Int, y: Int) = (x: 0, y: 3)
    var rh: (x: Int, y: Int) = (x: 2, y: 3)
    
    var answer = ""
    let points = numbers.map { n -> (x: Int, y: Int) in
        
        if n == 0 {
            return (x: 1, y: 3)
        }
        
        return (x: (n - 1) % 3, y: (n - 1) / 3)
        
    }
    
    for (i, n) in numbers.enumerated() {
        if [1, 4, 7].contains(n) {
            lh = points[i]
            answer += "L"
        }
        if [3, 6, 9].contains(n) {
            rh = points[i]
            answer += "R"
        }
        
        if [2, 5, 8, 0].contains(n) {
            let a = getLength(t1: points[i], t2: lh)
            let b = getLength(t1: points[i], t2: rh)
            
            if a > b {
                rh = points[i]
                answer += "R"
            }
            else if a < b {
                lh = points[i]
                answer += "L"
            }
            else {
                
                if hand == "right" {
                    rh = points[i]
                    answer += "R"
                }
                else {
                    lh = points[i]
                    answer += "L"
                }
            }
        }
    }
    
    return answer
}

func getLength(t1: (x: Int, y: Int), t2: (x: Int, y: Int)) -> Int {
    
    var answer = abs(t1.x - t2.x) + abs(t1.y - t2.y)
    
    if answer < 0 {
        answer = -answer
    }
    
    return answer
}


solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")
solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")
solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right")
