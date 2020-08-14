import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var height = 1
    var width = (brown + yellow) / height
    
    while width >= height {
        let edge = width * 2 + height * 2 - 4
        
        if edge == brown {
            break
        }
        height += 1
        while (brown + yellow) % height != 0 {
            height += 1
        }
        
        width = (brown + yellow) / height
    }
    
    return [width, height]
}



solution(24, 24)
