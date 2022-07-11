//
//  1697_숨바꼭질.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/11.
//

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

func dfs() {
    
    let max: Int = 100000
    var queue: [Int] = []
    var visited = [Int](repeating: 0, count: max + 1)

    queue.append(n)
    visited[n] = 1
    
    while !queue.isEmpty {
        let x = queue.removeFirst()
        
        if x == k {
            print(visited[x] - 1)
            break
        }
        
        for newX in [x - 1, x + 1, x * 2] {
            if newX >= 0 && newX <= max && visited[newX] == 0 {
                visited[newX] = visited[x] + 1
                queue.append(newX)
            }
        }
    }
}

dfs()
