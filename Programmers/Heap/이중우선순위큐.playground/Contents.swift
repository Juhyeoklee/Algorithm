import Foundation

struct Heap {
    var minHeap: [Int] = [-1]
    var maxHeap: [Int] = [-1]
    
    mutating func insert(num: Int) {
        insertMaxHeap(num)
        insertMinHeap(num)
    }
    private mutating func insertMinHeap(_ num: Int) {
        var lastIndex = self.minHeap.count
        self.minHeap.append(num)
        
        if lastIndex == 1 {
            return
        }
        
        var parentIndex: Int = lastIndex / 2
        
        while minHeap[parentIndex] > minHeap[lastIndex] {
            minHeap.swapAt(parentIndex, lastIndex)
            lastIndex = parentIndex
            parentIndex = lastIndex / 2
            if parentIndex == 0 {
                break
            }
        }

    }
    
    private mutating func insertMaxHeap(_ num: Int) {
        var lastIndex = self.maxHeap.count
        self.maxHeap.append(num)
        
        if lastIndex == 1 {
            return
        }
        
        var parentIndex: Int = lastIndex / 2
        
        while maxHeap[parentIndex] < maxHeap[lastIndex] {
            maxHeap.swapAt(parentIndex, lastIndex)
            lastIndex = parentIndex
            parentIndex = lastIndex / 2
            if parentIndex == 0 {
                break
            }
        }
        
    }
    mutating func deleteMax() {
        if maxHeap.count == 1 {
            return
        }
        maxHeap.swapAt(1, maxHeap.count - 1)
        maxHeap.removeLast()
        
        if maxHeap.count == 1 {
            minHeap.removeLast()
            return
        }
        var thisIndex = 1
        var leftChild = thisIndex * 2
        if leftChild > maxHeap.count - 1 {
            leftChild = thisIndex
        }
        var rightChild = thisIndex * 2 + 1
        if rightChild > maxHeap.count - 1 {
            rightChild = leftChild
        }
        
        while maxHeap[thisIndex] < maxHeap[leftChild] || maxHeap[thisIndex] < maxHeap[rightChild] {
            
            var child = leftChild
            if maxHeap[leftChild] < maxHeap[rightChild] {
                child = rightChild
            }
            maxHeap.swapAt(thisIndex, child)
            
            thisIndex = child
            leftChild = thisIndex * 2
            if leftChild > maxHeap.count - 1 {
                leftChild = thisIndex
            }
            rightChild = thisIndex * 2 + 1
            if rightChild > maxHeap.count - 1 {
                rightChild = leftChild
            }
            
        }
        
        minHeap.removeAll()
        minHeap.append(-1)
        for i in 1..<maxHeap.count {
            insertMinHeap(maxHeap[i])
        }
    }
    mutating func deleteMin() {
        if minHeap.count == 1 {
            return
        }
        minHeap.swapAt(1, minHeap.count - 1)
        minHeap.removeLast()
        
        if minHeap.count == 1 {
            maxHeap.removeLast()
            return
        }
        
        var thisIndex = 1
        var leftChild = thisIndex * 2
        if leftChild > minHeap.count - 1 {
            leftChild = thisIndex
        }
        var rightChild = thisIndex * 2 + 1
        if rightChild > minHeap.count - 1 {
            rightChild = leftChild
        }
        print(thisIndex, leftChild, rightChild)
        while minHeap[thisIndex] > minHeap[leftChild] || minHeap[thisIndex] > minHeap[rightChild] {
            
            var child = leftChild
            if minHeap[leftChild] > minHeap[rightChild] {
                child = rightChild
            }
            
            minHeap.swapAt(thisIndex, child)
            
            thisIndex = child
            leftChild = thisIndex * 2
            if leftChild > minHeap.count - 1 {
                leftChild = thisIndex
            }
            rightChild = thisIndex * 2 + 1
            if rightChild > minHeap.count - 1 {
                rightChild = leftChild
            }
            
        }
        
        maxHeap.removeAll()
        maxHeap.append(-1)
        for i in 1..<minHeap.count {
            insertMaxHeap(minHeap[i])
            
        }
        print(minHeap)
        print(maxHeap)
    }
    
    func max() -> Int {
        
        return maxHeap.count == 1 ? 0 : maxHeap[1]
    }
    func min() -> Int {
        
        return minHeap.count == 1 ? 0 : minHeap[1]
    }
    
}

func solution(_ operations:[String]) -> [Int] {
    var heap: Heap = Heap()
    
    
    for operation in operations {
        let operArr = operation.components(separatedBy: " ")
        let oper = operArr[0]
        let num = operArr[1]
        
        switch oper {
        case "I":
            heap.insert(num: Int(num)!)
        case "D":
            print(num)
            if num == "1"{
                heap.deleteMax()
            }
            else {
                heap.deleteMin()
            }
        default:
            break
        }
        
    }
    return [heap.max(), heap.min()]
}

solution(["I 16","D 1"])
solution(["I 7","I 5","I -5", "D -1"])
