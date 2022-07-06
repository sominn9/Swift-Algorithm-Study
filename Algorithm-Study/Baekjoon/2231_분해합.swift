//
//  2231_분해합.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

// N = M + M을 이루는 각 자리수의 합 (M은 N의 생성자)
let n = Int(readLine()!)!

let first = (0..<n).first { num in
    num + String(num).reduce(0) { $0 + $1.wholeNumberValue! } == n
}

print(first ?? 0)
