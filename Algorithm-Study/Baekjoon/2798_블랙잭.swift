//
//  2798_블랙잭.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

// 3장의 카드의 합이 M을 넘지 않으면서 M에 최대한 가깝게 만들어야 한다
let m: Int = Int(String(readLine()!.split(separator: " ")[1]))!
var cards: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// 조합을 사용하여 모든 경우의 수를 구한다
func combination<T: Comparable>(_ arr: [T], _ r: Int) -> [[T]] {
    var result: [[T]] = []
    
    func cycle(_ now: [T], index: Int) {
        if now.count == r {
            result.append(now)
            return
        }
        for i in index..<arr.count {
            cycle(now + [arr[i]], index: i+1)
        }
    }
    
    cycle([], index: 0)
    return result
}

let result: [Int] = combination(cards, 3).map { $0.reduce(0, +) }
print(result.filter { $0 <= m }.max()!)
