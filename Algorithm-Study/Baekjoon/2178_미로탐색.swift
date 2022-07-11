//
//  2178_미로탐색.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/11.
//

import Foundation

struct Queue<T> {
    
    private var array = [T?]()
    private var head = 0
    
    var isEmpty: Bool { count == 0 }
    var count: Int { array.count - head }
    var front: T? { isEmpty ? nil : array[head] }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        // 빈 공간과 전체 배열의 비율을 계산해서 배열의 25%가 사용되지 않으면 빈 공간을 잘라낸다
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var grid: [[Int]] = []
for _ in 0..<n {
    let line = Array<Character>(readLine()!).map { Int(String($0))! }
    grid.append(line)
}

func bfs(_ grid: inout [[Int]]) -> Int {
    
    // 상, 하, 좌, 우 방향
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    
    var queue: Queue<(Int, Int)> = Queue()
    queue.enqueue((0, 0))
    
    while !queue.isEmpty {
        guard let (row, col) = queue.dequeue() else { break }
        
        // 현재 위치에서 상, 하, 좌, 우 방향으로 미로를 탐색한다
        for i in 0..<4 {
            let (newRow, newCol) = (row + dy[i], col + dx[i])
            guard newRow >= 0, newCol >= 0, newRow < n, newCol < m else { continue }
            
            // 만약 노드를 처음 방문하면 (이전 노드까지의 최단 경로 + 1)을 한다
            if grid[newRow][newCol] == 1 {
                grid[newRow][newCol] = grid[row][col] + 1
                queue.enqueue((newRow, newCol))
            }
        }
    }
    
    return grid[n-1][m-1]
}

print(bfs(&grid))
