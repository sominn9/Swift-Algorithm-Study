//
//  16928_뱀과사다리게임.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (numOfLadders, numOfSnakes) = (input[0], input[1])

// 사다리 정보 입력받기 (x < y)
var ladders = [Int: Int]()
for _ in 0..<numOfLadders {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    ladders[line[0]] = line[1]
}

// 뱀 정보 입력받기 (u > v)
var snakes = [Int: Int]()
for _ in 0..<numOfSnakes {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    snakes[line[0]] = line[1]
}

// 뱀과 사다리 게임
func snakesAndLadders() {
    
    var queue: [(x: Int, count: Int)] = [(1, 0)]
    var head = 0
    var visited = Set([1])
    
    while !queue.isEmpty {
        let (x, count) = queue[head]
        head += 1
        
        if x == 100 {
            print(count)
            break
        }
        
        // 현재 위치 + 주사위를 굴려서 나오는 눈 (1...6)
        let destination = ((x + 1)...(x + 6)).map {
            ladders[$0] ?? (snakes[$0] ?? $0)
        }
        
        for i in destination where i <= 100 {
            if !visited.contains(i) {
                visited.insert(i)
                queue.append((i, count + 1))
            }
        }
    }
}

snakesAndLadders()
