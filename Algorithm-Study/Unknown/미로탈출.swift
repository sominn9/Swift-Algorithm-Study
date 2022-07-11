//
//  미로탈출.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/11.
//

import Foundation

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var grid: [[Int]] = []
for _ in 0..<n {
    let line: [Int] = Array<Character>(readLine()!).map { Int(String($0))! }
    grid.append(line)
}

func bfs(_ grid: inout [[Int]]) -> Int {
    
    // 이동할 4가지 방향 (상, 하, 좌, 우)
    let dy: [Int] = [-1, 1, 0, 0]
    let dx: [Int] = [0, 0, -1, 1]
    
    var queue: [(row: Int, col: Int)] = [(0, 0)]
    
    while !queue.isEmpty {
        let (row, col) = queue.removeFirst()
        
        for i in 0..<4 {
            let (newRow, newCol) = (row + dy[i], col + dx[i])
            
            // 공간을 벗어났거나 과물을 마주치면 무시
            guard newRow >= 0, newRow < n, newCol >= 0, newCol < m, grid[newRow][newCol] != 0 else {
                continue
            }
            
            // 해당 노드를 처음 방문하는 경우에만 최단 거리 기록
            if grid[newRow][newCol] == 1 {
                grid[newRow][newCol] = grid[row][col] + 1
                queue.append((newRow, newCol))
            }
        }
    }
    // 가장 오른쪽 아래까지의 최단 거리 반환
    return grid[n-1][m-1]
}

func printGrid(_ grid: inout [[Int]]) {
    for row in 0..<grid.count {
        print(grid[row])
    }
}

printGrid(&grid)

print(bfs(&grid))
