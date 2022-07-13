//
//  2206_벽부수고이동하기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var grid = [[Int]]()
for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    grid.append(line)
}

func breakTheWall() {
    
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    
    var queue: [(wall: Int, row: Int, col: Int)] = [(0, 0, 0)]
    var head = 0
    
    var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: m), count: n), count: 2)
    visited[0][0][0] = 1

    while head < queue.count {
        let (wall, row, col) = queue[head]
        head += 1
        
        if row == n - 1 && col == m - 1 {
            print(visited[wall][row][col])
            return
        }
        
        // 상, 하, 좌, 우 방향으로 노드 방문
        for i in 0..<4 {
            let (newRow, newCol) = (row + dy[i], col + dx[i])
            guard newRow >= 0, newCol >= 0, newRow < n, newCol < m else { continue }
            
            // 벽이 아니고, 방문한 적이 없을 때
            if grid[newRow][newCol] == 0 && visited[wall][newRow][newCol] == 0 {
                visited[wall][newRow][newCol] = visited[wall][row][col] + 1
                queue.append((wall, newRow, newCol))
            }
            // 벽이고, 벽을 부순적이 없을 때
            else if grid[newRow][newCol] == 1 && wall == 0 {
                visited[1][newRow][newCol] = visited[wall][row][col] + 1
                queue.append((1, newRow, newCol))
            }
        }
    }
    print(-1)
}

breakTheWall()
