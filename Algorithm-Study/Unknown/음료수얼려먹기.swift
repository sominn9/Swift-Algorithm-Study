//
//  음료수얼려먹기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/11.
//

import Foundation

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var grid: [[Int]] = []
for _ in 0..<n {
    let row: [Int] = Array<Character>(readLine()!).map { Int(String($0))! }
    grid.append(row)
}

func dfs(_ row: Int, _ col: Int, _ grid: inout [[Int]]) {
    guard row >= 0, row < grid.count, col >= 0, col < grid[0].count, grid[row][col] == 0 else {
        return
    }
    grid[row][col] = 1
    // 상, 하, 좌, 우 방문을 통해 연결된 노드를 모두 방문한다
    dfs(row+1, col, &grid)
    dfs(row-1, col, &grid)
    dfs(row, col+1, &grid)
    dfs(row, col-1, &grid)
}

var count: Int = 0
for row in 0..<n {
    for col in 0..<m {
        // 얼음 틀에 구멍이 뚫려 있으면 DFS 탐색을 시작한다
        if grid[row][col] == 0 {
            dfs(row, col, &grid)
            count += 1
        }
    }
}

print(count)
