//
//  7576_토마토.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/12.
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

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[1], input[0])

var box = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    box.append(line)
}

func tomato(_ box: inout [[Int]]) -> Int {
    
    // 처음부터 모든 토마토가 익어있으면 0 출력
    if box.flatMap({ $0 }).filter({ $0 == 0 }).isEmpty {
        return 0
    }
    
    // 익은 토마토를 모두 찾아서 큐에 넣는다
    var queue = Queue<(Int, Int)>()
    
    for row in 0..<box.count {
        for col in 0..<box[0].count {
            if box[row][col] == 1 {
                queue.enqueue((row, col))
            }
        }
    }
    
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    var day = 0
    
    while !queue.isEmpty {
        guard let (row, col) = queue.dequeue() else { break }
        
        // 익은 토마토에서 상, 하, 좌, 우 방향으로 탐색한다
        for i in 0..<4 {
            let (newRow, newCol) = (row + dy[i], col + dx[i])
            guard newRow >= 0, newCol >= 0, newRow < box.count, newCol < box[0].count else { continue }
            
            // 익지 않은 토마토를 만나면 익게 만든다
            if box[newRow][newCol] == 0 {
                box[newRow][newCol] = box[row][col] + 1
                queue.enqueue((newRow, newCol))
                day = max(day, box[newRow][newCol])
            }
        }
    }
    
    //  익은 토마토가 하나도 없거나(day == 0), 익지 않은 토마토가 있으면(0 in box) -1 출력
    if day == 0 || box.flatMap({ $0 }).contains(0) {
        return -1
    }
    return day - 1
}

print(tomato(&box))
