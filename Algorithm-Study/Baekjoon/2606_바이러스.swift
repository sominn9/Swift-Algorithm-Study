//
//  2606_바이러스.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/11.
//

import Foundation

let numOfComputers = Int(readLine()!)!
let numOfPairs = Int(readLine()!)!

var network: [[Int]] = [[Int]](repeating: [Int](), count: numOfComputers + 1)
for _ in 0..<numOfPairs {
    let pair: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    network[pair[0]].append(pair[1])
    network[pair[1]].append(pair[0])
}

func bfs(_ numOfComputers: Int, _ network: inout [[Int]]) -> Int {
    
    var queue: [Int] = [1]
    var visited = [Bool](repeating: false, count: numOfComputers + 1)
    visited[1] = true
    
    var count: Int = 0
    while !queue.isEmpty {
        let curr: Int = queue.removeFirst()
        for node in network[curr] {
            if !visited[node] {
                visited[node] = true
                queue.append(node)
                count += 1
            }
        }
    }
    
    return count
}

print(bfs(numOfComputers, &network))
