import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: n), count: n), count: 2)
    
    for (i, a1) in arr1.enumerated() {
        map[0][i] = makeBinary(num: a1, size: n)
    }
    for (i, a2) in arr2.enumerated() {
        map[1][i] = makeBinary(num: a2, size: n)
    }
    
    for row in 0..<n {
        var rst = ""
        
        for col in 0..<n {
            if map[0][row][col] + map[1][row][col] == 0 {
                rst += " "
            }
            else {
                rst += "#"
            }
        }
        
        answer.append(rst)
    }
    
    return answer
}


func makeBinary(num: Int, size: Int) -> [Int] {
    var answer = [Int](repeating: 0, count: size)
    var index = size - 1
    var tmp = num
    
    while tmp != 0 {
        answer[index] = tmp % 2
        tmp = tmp / 2
        
        index -= 1
    }
    
    
    return answer
}

func printArr(arr: [[Int]]) {
    for a in arr {
        print(a)
    }
}

solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])
