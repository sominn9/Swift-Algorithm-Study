//
//  16948_데스나이트.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/13.
//

import Foundation

let n = Int(readLine()!)!
let pos = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r1, c1) = (pos[0], pos[1])
let (r2, c2) = (pos[2], pos[3])

func deathKnight() {
    
    let dy = [-2, -2, 0, 0, 2, 2]
    let dx = [-1, 1, -2, 2, -1, 1]
    
    var queue: [(Int, Int)] = []
    var head = 0
    var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    queue.append((r1, c1))
    
    while head < queue.count {
        let (row, col) = queue[head]
        head += 1
        
        if (row, col) == (r2, c2) {
            print(visited[row][col])
            return
        }
        
        for i in 0..<6 {
            let (newRow, newCol) = (row + dy[i], col + dx[i])
            guard newRow >= 0, newCol >= 0, newRow < n, newCol < n else { continue }
            
            if visited[newRow][newCol] == 0 {
                visited[newRow][newCol] = visited[row][col] + 1
                queue.append((newRow, newCol))
            }
        }
    }
    print(-1)
}

deathKnight()
