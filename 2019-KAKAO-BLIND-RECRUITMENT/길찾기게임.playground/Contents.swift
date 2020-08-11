import Foundation

class Node {
    var num: Int
    var position: (Int, Int)
    
    init(num : Int, position: (Int, Int)) {
        self.num = num
        self.position = position
    }
    var childLeftRange = -1
    var childRightRange = 100001
    var depth = 0
    var left: Node?
    var right: Node?
}

var preOder: [Int] = []
var postOrder: [Int] = []
var tree: [[Node]] = []

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    
    var curHeight = nodeinfo.sorted { (n1, n2) in
        return n1[1] > n2[1]
        }[0][1]
    var depth = 1
    
    var nodes: [Node] = nodeinfo.map {
        return Node(num: nodeinfo.firstIndex(of: $0)! + 1, position: ($0[0], $0[1]))
    }.sorted { (n1, n2) in
        if n1.position.1 == n2.position.1 {
            return n1.position.0 < n2.position.0
        }
        else {
            return n1.position.1 > n2.position.1
        }
    }.compactMap {
        if curHeight != $0.position.1 {
            curHeight = $0.position.1
            depth += 1
        }
        $0.depth = depth
        return $0
    }
    tree = Array(repeating: [], count: depth)
    for n in nodes {
        tree[n.depth - 1].append(n)
    }
    
//    for i in 1...depth {
//        tree.append(nodes.filter{
//            return $0.depth == i
//        })
//    }
//    dump(tree)

    for i in 0..<nodes.count {
        let n = nodes[i]
        let dp = n.depth
        if dp == depth {
            break
        }
        let childs = tree[dp].filter {
            return $0.position.0 > n.childLeftRange && $0.position.0 < n.childRightRange
        }
        
        if childs.count == 2 {
            nodes[i].left = childs.first
            nodes[i].right = childs.last
        }
        else if childs.count == 1 {
            if childs.first!.position.0 < n.position.0 {
                nodes[i].left = childs.first
            }
            else {
                nodes[i].right = childs.first
            }
        }
        
        nodes[i].left?.childLeftRange = n.childLeftRange
        nodes[i].left?.childRightRange = n.position.0
        
        nodes[i].right?.childLeftRange = n.position.0
        nodes[i].right?.childRightRange = n.childRightRange
    }
    preOrderSearch(start: nodes[0])
    postOrderSearch(start: nodes[0])
    
    return [preOder, postOrder]
}

func preOrderSearch(start: Node) {
    
    preOder.append(start.num)
    
    if let left = start.left {
        preOrderSearch(start: left)
    }
    if let right = start.right {
        preOrderSearch(start: right)
    }
}

func postOrderSearch(start: Node) {
    
    if let left = start.left {
        postOrderSearch(start: left)
    }
    if let right = start.right {
        postOrderSearch(start: right)
    }
    postOrder.append(start.num)
}


solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]])
//solution([[2, 2]])
