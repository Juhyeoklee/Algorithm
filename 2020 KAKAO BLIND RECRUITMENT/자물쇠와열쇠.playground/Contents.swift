import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var newArr: [[Int]] = key
    var bigArr:[[Int]] = Array(repeating: Array(repeating: 0, count: lock[0].count + key[0].count * 2), count: lock.count + key.count * 2)
    
    for i in 0..<lock.count {
        for j in 0..<lock[0].count {
            bigArr[key.count + i][key[0].count + j] = lock[i][j]
        }
    }

//    for i in 0..<bigArr.count {
//        for j in 0..<bigArr[0].count {
//            print(bigArr[i][j], terminator: " ")
//        }
//        print()
//    }
//

    for _ in 0...3 {
        newArr = turnArr(newArr)
        
        for i in 1..<bigArr.count { // row
            for j in 1..<bigArr[0].count { // column
                if i + newArr.count - 1 >= bigArr.count - 1 || j + newArr.count - 1 >= bigArr[0].count - 1 {
                    continue
                }
                var result = true
                bigArr = Array(repeating: Array(repeating: 0, count: lock[0].count + key[0].count * 2), count: lock.count + key.count * 2)
                
                for i in 0..<lock.count {
                    for j in 0..<lock[0].count {
                        bigArr[key.count + i][key[0].count + j] = lock[i][j]
                    }
                }
                
                for k in 0..<newArr.count {
                    for l in 0..<newArr[0].count {
                        bigArr[i + k][j + l] = newArr[k][l] + bigArr[i + k][j + l]
                        
//                        print(bigArr[i+k][j + l], terminator: " ")
//                        print()
//                        print(newArr[k][l])
//                        print(i, j, separator: " " )
                        if bigArr[i + k][j + l] == 2 {
                            result = false
                            break
                        }
                    }
                    if !result {
                        break
                    }
                }
//                for i in 0..<bigArr.count {
//                    for j in 0..<bigArr[0].count {
//                        print(bigArr[i][j], terminator: " ")
//                    }
//                    print()
//                }
//                print()
                if !result {
                    continue
                }
                for k in 0..<lock.count {
                    for l in 0..<lock[0].count {
                        if bigArr[key.count + k][key[0].count + l] == 2 || bigArr[key.count + k][key[0].count + l] == 0 {
                            result = false
                        }
                    }
                }
                
                if result {
                    return true
                }
            }
        }
    }
    
    return false
}

func turnArr(_ arr: [[Int]]) -> [[Int]]{
    var newArr:[[Int]] = Array(repeating: [], count: arr[0].count)
    let arrRowCount = arr.count - 1
    let arrColumnCount = arr[0].count - 1

    for newRow in 0...arrColumnCount {
        for newColumn in 0...arrRowCount {
            newArr[newRow].append(arr[arrRowCount-newColumn][newRow])
        }
    }
    
    
    
    return newArr
}

solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])
//solution([[1,1], [1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])

