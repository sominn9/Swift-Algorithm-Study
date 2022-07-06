//
//  2231_분해합.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

// N = M + M을 이루는 각 자리수의 합 (M은 N의 생성자)
let n = Int(readLine()!)!
var result: [Int] = []

for num in 0..<n {
    let digit: [Int] = Array(String(num)).map { Int(String($0))! }
    if num + digit.reduce(0, +) == n {
        result.append(num)
    }
}

if result.isEmpty {
    print(0)
} else {
    print(result.min()!)
}
