//
//  16926_상하좌우.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

let size: Int = Int(readLine()!)!
let plans: [String] = readLine()!.components(separatedBy: " ")
var result: (x: Int, y: Int) = (1, 1)

// L, R, U, D 에 따른 이동 방향
let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]
let moveTypes: [String: Int] = ["L": 0, "R": 1, "U": 2, "D": 3]

for plan in plans {
    let nx = result.x + dx[moveTypes[plan]!]
    let ny = result.y + dy[moveTypes[plan]!]
    
    guard nx >= 1, ny >= 1, nx <= size, ny <= size else { continue }
    result = (nx, ny)
}

print(result)
