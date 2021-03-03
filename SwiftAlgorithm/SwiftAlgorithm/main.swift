//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 이주혁 on 2020/11/04.
//



//var sudoku: [[Int]] = [[Int]](repeating: [], count: 9)
//
//for i in 0..<9 {
//    sudoku[i] = readLine()!.split(separator: " ").map{ return Int($0)! }
//}
//
//
//for s in sudoku {
//    print(s)
//}
var s = Solution()
print(
//Solution().countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])
    s.kWeakestRows([[1,1,0,0,0],
                    [1,1,1,1,0],
                    [1,0,0,0,0],
                    [1,1,0,0,0],
                    [1,1,1,1,1]], 3)
)
