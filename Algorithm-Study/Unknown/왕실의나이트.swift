//
//  왕실의나이트.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

let current: [String] = Array(readLine()!).map { String($0) }
let mapping: [String: Int] = [
    "a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8
]

// 나이트가 이동할 수 있는 방향벡터 (8개)
let row: [Int] = [ 1, 2, 1, 2, -2,-1,-2,-1]
let col: [Int] = [-2,-1, 2, 1,  1, 2, 1, 2]

var count: Int = 0
for i in 0..<8 {
    let newRow = Int(current[1])! + row[i]
    let newCol = mapping[current[0]]! + col[i]
    
    
    guard newRow >= 1, newCol >= 1, newRow <= 8, newCol <= 8 else { continue }
    count += 1
}

print(count)
