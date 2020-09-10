import Foundation

struct Robot {
    var leftPosition, rightPosition: Position
    var axis: Axis
    var length: Int = 0
    
//    description
    enum Axis {
        case vertival, horizontal
    }
    
    
}

struct Position {
    var row, col : Int
}

func solution(_ board:[[Int]]) -> Int {
    
    var answer = 999999999999
    
    var map = board
    var rightCheck = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
    var leftCheck = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
    
    var robot: Robot = Robot(leftPosition: Position(row: 0, col: 0),
                             rightPosition: Position(row: 0, col: 1),
                             axis: .horizontal)
    leftCheck[0][0] = true
    rightCheck[0][1] = true
    
    var queue: [Robot] = []
    queue.append(robot)
    
    while !queue.isEmpty {
        if let front = queue.first {
            print("Front : \(front.leftPosition), \(front.rightPosition), \(front.length)")
            if (front.rightPosition.row == board.count - 1 && front.rightPosition.col == board.count - 1)
                || (front.leftPosition.row == board.count - 1 && front.leftPosition.col == board.count - 1) {
                if answer > front.length {
                    answer = front.length
                }
                
                // break
            }
            
            if front.leftPosition.row > 0 && front.rightPosition.row > 0 {
                if !rightCheck[front.rightPosition.row - 1][front.rightPosition.col]
                    || !leftCheck[front.leftPosition.row - 1][front.leftPosition.col] {
                    var r = front
                    if moveUp(map: map, position: &r) {
                        rightCheck[front.rightPosition.row - 1][front.rightPosition.col] = true
                        leftCheck[front.leftPosition.row - 1][front.leftPosition.col] = true
                        r.length += 1
                        queue.append(r)
                    }
                }
            }
            
            if front.leftPosition.row < map.count - 1 && front.rightPosition.row < map.count - 1 {
                if !rightCheck[front.rightPosition.row + 1][front.rightPosition.col]
                    || !leftCheck[front.leftPosition.row + 1][front.leftPosition.col] {
                    var r = front
                    if moveDown(map: map, position: &r) {
                        rightCheck[front.rightPosition.row + 1][front.rightPosition.col] = true
                        leftCheck[front.leftPosition.row + 1][front.leftPosition.col] = true
                        r.length += 1
                        queue.append(r)
                    }
                }
            }
            
            if front.leftPosition.col > 0 && front.rightPosition.col > 0 {
                if !rightCheck[front.rightPosition.row][front.rightPosition.col - 1]
                    || !leftCheck[front.leftPosition.row][front.leftPosition.col - 1] {
                    var r = front
                    if moveLeft(map: map, position: &r) {
                        rightCheck[front.rightPosition.row][front.rightPosition.col - 1] = true
                        leftCheck[front.leftPosition.row][front.leftPosition.col - 1] = true
                        r.length += 1
                        queue.append(r)
                    }
                }
            }
            
            if front.rightPosition.col < map[0].count - 1 && front.leftPosition.col < map[0].count - 1 {
                if !rightCheck[front.rightPosition.row][front.rightPosition.col + 1]
                    || !leftCheck[front.leftPosition.row][front.leftPosition.col + 1] {
                    var r = front
                    if moveRight(map: map, position: &r) {
                        rightCheck[front.rightPosition.row][front.rightPosition.col + 1] = true
                        leftCheck[front.leftPosition.row][front.leftPosition.col + 1] = true
                        r.length += 1
                        queue.append(r)
                    }
                }
            }
            
            if front.axis == .horizontal {
                if front.rightPosition.row > 0 && front.rightPosition.col > front.leftPosition.col {
                    if !rightCheck[front.rightPosition.row - 1][front.rightPosition.col - 1] {
                        var r = front
                        if rotateRightPosition90degreesCounterclockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row - 1][front.rightPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                if front.rightPosition.row < map.count - 1 && front.rightPosition.col < front.leftPosition.col {
                    if !rightCheck[front.rightPosition.row + 1][front.rightPosition.col + 1] {
                        var r = front
                        if rotateRightPosition90degreesCounterclockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row + 1][front.rightPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                
                if front.rightPosition.row < map.count - 1 && front.rightPosition.col > front.leftPosition.col {
                    if !rightCheck[front.rightPosition.row + 1][front.rightPosition.col - 1] {
                        var r = front
                        if rotateRightPosition90degreesClockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row + 1][front.rightPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                if front.rightPosition.row > 0 && front.rightPosition.col < front.leftPosition.col {
                    if !rightCheck[front.rightPosition.row - 1][front.rightPosition.col + 1] {
                        var r = front
                        if rotateRightPosition90degreesClockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row - 1][front.rightPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }

                
                if front.leftPosition.row > 0 && front.leftPosition.col < front.rightPosition.col {
                    if !leftCheck[front.leftPosition.row - 1][front.leftPosition.col + 1] {
                        var r = front
                        if rotateLeftPosition90degreesClockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row - 1][front.leftPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.leftPosition.row < map.count - 1 && front.leftPosition.col > front.rightPosition.col {
                    if !leftCheck[front.leftPosition.row + 1][front.leftPosition.col - 1] {
                        var r = front
                        if rotateLeftPosition90degreesClockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row + 1][front.leftPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.leftPosition.row < map.count - 1 && front.leftPosition.col < front.rightPosition.col {
                    if !leftCheck[front.leftPosition.row + 1][front.leftPosition.col + 1] {
                        var r = front
                        if rotateLeftPosition90degreesCounterclockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row + 1][front.leftPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.leftPosition.row > 0 && front.leftPosition.col > front.rightPosition.col {
                    if !leftCheck[front.leftPosition.row - 1][front.leftPosition.col - 1] {
                        var r = front
                        if rotateLeftPosition90degreesCounterclockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row - 1][front.leftPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
            }
            else {
                if front.rightPosition.col > 0 && front.rightPosition.row < front.leftPosition.row {
                    if !rightCheck[front.rightPosition.row + 1][front.rightPosition.col - 1] {
                        var r = front
                        if rotateRightPosition90degreesCounterclockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row + 1][front.rightPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.rightPosition.col < map[0].count - 1 && front.rightPosition.row > front.leftPosition.row {
                      if !rightCheck[front.rightPosition.row - 1][front.rightPosition.col + 1] {
                          var r = front
                          if rotateRightPosition90degreesCounterclockwise(map: map, position: &r) {
                              rightCheck[front.rightPosition.row - 1][front.rightPosition.col + 1] = true
                              r.length += 1
                              queue.append(r)
                          }
                      }
                  }
                
                
                if front.rightPosition.col < map[0].count - 1 && front.rightPosition.row < front.leftPosition.row {
                    if !rightCheck[front.rightPosition.row + 1][front.rightPosition.col + 1] {
                        var r = front
                        if rotateRightPosition90degreesClockwise(map: map, position: &r) {
                            rightCheck[front.rightPosition.row + 1][front.rightPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                if front.rightPosition.col > 0 && front.rightPosition.row > front.leftPosition.row {
                     if !rightCheck[front.rightPosition.row - 1][front.rightPosition.col - 1] {
                         var r = front
                         if rotateRightPosition90degreesClockwise(map: map, position: &r) {
                             rightCheck[front.rightPosition.row - 1][front.rightPosition.col - 1] = true
                             r.length += 1
                             queue.append(r)
                         }
                     }
                 }
                
                if front.leftPosition.col > 0 && front.leftPosition.row > front.rightPosition.row {
                    if !leftCheck[front.leftPosition.row - 1][front.leftPosition.col - 1] {
                        var r = front
                        if rotateLeftPosition90degreesClockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row - 1][front.leftPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.leftPosition.col < map[0].count - 1 && front.leftPosition.row < front.rightPosition.row {
                    if !leftCheck[front.leftPosition.row + 1][front.leftPosition.col + 1] {
                        var r = front
                        if rotateLeftPosition90degreesClockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row + 1][front.leftPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                
                if front.leftPosition.col < map[0].count - 1 && front.leftPosition.row > front.rightPosition.row {
                    if !leftCheck[front.leftPosition.row - 1][front.leftPosition.col + 1] {
                        var r = front
                        if rotateLeftPosition90degreesCounterclockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row - 1][front.leftPosition.col + 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
                if front.leftPosition.col > 0 && front.leftPosition.row < front.rightPosition.row {
                    if !leftCheck[front.leftPosition.row + 1][front.leftPosition.col - 1] {
                        var r = front
                        if rotateLeftPosition90degreesCounterclockwise(map: map, position: &r) {
                            leftCheck[front.leftPosition.row + 1][front.leftPosition.col - 1] = true
                            r.length += 1
                            queue.append(r)
                        }
                    }
                }
            }

            queue.removeFirst()
            print(queue.map { (r) -> String in
                return "\(r.leftPosition), \(r.rightPosition), \(r.length)"
            })
        }
    }

    
    return answer
}


solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]])
//solution([[0, 0, 0, 0, 0, 0, 1], [1, 1, 1, 1, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 1, 1], [0, 0, 1, 0, 0, 0, 0]])
//solution([[0, 0, 0, 0, 0, 0, 1], [1, 1, 1, 1, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 1, 0], [0, 0, 1, 0, 0, 0, 0]])
//solution([[0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0]])


func moveRight(map: [[Int]], position: inout Robot) -> Bool {
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    if rightPosition.col < map[0].count - 1 {
        if map[rightPosition.row][rightPosition.col + 1] != 1 && map[leftPosition.row][leftPosition.col + 1] != 1 {
            //print(#function)
            position.leftPosition.col += 1
            position.rightPosition.col += 1
            
            return true
        }
    }
    
    return false
    
}

func moveLeft(map: [[Int]], position: inout Robot) -> Bool {
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    if leftPosition.col > 0 {
        if map[leftPosition.row][leftPosition.col - 1] != 1 && map[rightPosition.row][rightPosition.col - 1] != 1 {
            //print(#function)
            position.leftPosition.col -= 1
            position.rightPosition.col -= 1
            
            return true
        }
    }
    
    return false
}

func moveDown(map: [[Int]], position: inout Robot) -> Bool {
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    if  leftPosition.row < map.count - 1 {
        if map[leftPosition.row + 1][leftPosition.col] != 1 && map[rightPosition.row + 1][rightPosition.col] != 1 {
            //print(#function)
            position.leftPosition.row += 1
            position.rightPosition.row += 1
         
            return true
        }
    }
    
    return false
}

func moveUp(map: [[Int]], position: inout Robot) -> Bool {

    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    if leftPosition.row > 0 {
        if map[leftPosition.row - 1][leftPosition.col] != 1 && map[rightPosition.row - 1][rightPosition.col] != 1 {
            //print(#function)
            position.leftPosition.row -= 1
            position.rightPosition.row -= 1
            
            return true
        }
    }
    
    return false
}

func rotateLeftPosition90degreesCounterclockwise(map: [[Int]],
                                                 position: inout Robot) -> Bool {

    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    switch position.axis {
    case .horizontal:
        if leftPosition.col > rightPosition.col {
            if map[leftPosition.row - 1][leftPosition.col] != 1 && map[leftPosition.row - 1][leftPosition.col - 1] != 1 {
                //print(#function)
                position.leftPosition.row -= 1
                position.leftPosition.col -= 1
                position.axis = .vertival
                
                return true
            }
        }
        else {
            if map[leftPosition.row + 1][leftPosition.col] != 1 && map[leftPosition.row + 1][leftPosition.col + 1] != 1 {
                //print(#function)
                position.leftPosition.row += 1
                position.leftPosition.col += 1
                position.axis = .vertival
                
                return true
            }
        }
    case .vertival:
        if leftPosition.row > rightPosition.row {
            if map[leftPosition.row][leftPosition.col + 1] != 1 && map[leftPosition.row - 1][leftPosition.col + 1] != 1 {
                //print(#function)
                position.leftPosition.row -= 1
                position.leftPosition.col += 1
                position.axis = .horizontal
                
                return true
            }
        }
        else {
            if map[leftPosition.row][leftPosition.col - 1] != 1 && map[leftPosition.row + 1][leftPosition.col - 1] != 1 {
                //print(#function)
                position.leftPosition.row += 1
                position.leftPosition.col -= 1
                position.axis = .horizontal
                
                return true
            }
        }
    }
    
    return false
}

func rotateLeftPosition90degreesClockwise(map: [[Int]],
                                                 position: inout Robot) -> Bool {
    
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    switch position.axis {
    case .horizontal:
        if leftPosition.col > rightPosition.col {
            if map[leftPosition.row + 1][leftPosition.col] != 1 && map[leftPosition.row + 1][leftPosition.col - 1] != 1 {
                //print(#function)
                position.leftPosition.row += 1
                position.leftPosition.col -= 1
                position.axis = .vertival
                
                return true
            }
        }
        else {
            if map[leftPosition.row - 1][leftPosition.col] != 1 && map[leftPosition.row - 1][leftPosition.col + 1] != 1 {
                //print(#function)
                position.leftPosition.row -= 1
                position.leftPosition.col += 1
                position.axis = .vertival
                
                return true
            }
        }
    case .vertival:
        if leftPosition.row > rightPosition.row {
            if map[leftPosition.row][leftPosition.col - 1] != 1 && map[leftPosition.row - 1][leftPosition.col - 1] != 1 {
                //print(#function)
                position.leftPosition.row -= 1
                position.leftPosition.col -= 1
                position.axis = .horizontal
                
                return true
            }
        }
        else {
            if map[leftPosition.row][leftPosition.col + 1] != 1 && map[leftPosition.row + 1][leftPosition.col + 1] != 1 {
                //print(#function)
                position.leftPosition.row += 1
                position.leftPosition.col += 1
                position.axis = .horizontal
                
                return true
            }
        }
    }
    
    return false
}

func rotateRightPosition90degreesCounterclockwise(map: [[Int]], position: inout Robot) -> Bool {
    
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    switch position.axis {
    case .horizontal:
        if rightPosition.col > leftPosition.col {
            if map[rightPosition.row - 1][rightPosition.col] != 1 && map[rightPosition.row - 1][rightPosition.col - 1] != 1 {
                position.rightPosition.row -= 1
                position.rightPosition.col -= 1
                position.axis = .vertival
                //print(#function)
                return true
            }
        }
        else {
            if map[rightPosition.row + 1][rightPosition.col] != 1 && map[rightPosition.row + 1][rightPosition.col + 1] != 1 {
                position.rightPosition.row += 1
                position.rightPosition.col += 1
                position.axis = .vertival
                //print(#function)
                return true
            }
        }
        
    case .vertival:
        if rightPosition.row > leftPosition.row {
            if map[rightPosition.row][rightPosition.col + 1] != 1 && map[rightPosition.row - 1][rightPosition.col + 1] != 1 {
                
                position.rightPosition.row -= 1
                position.rightPosition.col += 1
                position.axis = .horizontal
                //print(#function)
                return true
            }
        }
        else {
            if map[rightPosition.row][rightPosition.col - 1] != 1 && map[rightPosition.row + 1][rightPosition.col - 1] != 1 {
                 
                 position.rightPosition.row += 1
                 position.rightPosition.col -= 1
                 position.axis = .horizontal
                 //print(#function)
                 return true
             }
        }
    }
    
    return false
}



func rotateRightPosition90degreesClockwise(map: [[Int]],
                                           position: inout Robot) -> Bool {
    
    
    let rightPosition = position.rightPosition
    let leftPosition = position.leftPosition
    
    
    switch position.axis {
    case .horizontal:
        if rightPosition.col > leftPosition.col {
            if map[rightPosition.row + 1][rightPosition.col] != 1 && map[rightPosition.row + 1][rightPosition.col - 1] != 1 {
                //print(#function)
                position.rightPosition.row += 1
                position.rightPosition.col -= 1
                position.axis = .vertival
                return true
            }
        }
        else {
            if map[rightPosition.row - 1][rightPosition.col] != 1 && map[rightPosition.row - 1][rightPosition.col + 1] != 1 {
                //print(#function)
                position.rightPosition.row -= 1
                position.rightPosition.col += 1
                position.axis = .vertival
                return true
            }
        }
    case .vertival:
        if rightPosition.row > leftPosition.row {
            if map[rightPosition.row][rightPosition.col - 1] != 1 && map[rightPosition.row - 1][rightPosition.col - 1] != 1 {
                //print(#function)
                position.rightPosition.row -= 1
                position.rightPosition.col -= 1
                position.axis = .horizontal
                
                return true
            }
        }
        else {
            if map[rightPosition.row][rightPosition.col + 1] != 1 && map[rightPosition.row + 1][rightPosition.col + 1] != 1 {
                //print(#function)
                position.rightPosition.row += 1
                position.rightPosition.col += 1
                position.axis = .horizontal
                
                return true
            }
        }
    }
    
    return false
}
