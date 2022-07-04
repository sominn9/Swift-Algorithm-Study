//
//  62048_멀쩡한사각형.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/04.
//

import Foundation

func solution(_ w: Int, _ h: Int) -> Int64 {
    let patternCount: Int64 = gcd(w, h)
    let patternW: Int64 = Int64(w) / patternCount
    let patternH: Int64 = Int64(h) / patternCount
    let patterns: Int64 = (patternW + patternH - 1) * patternCount
    return Int64(w) * Int64(h) - patterns
}

// 최대공약수 구하기
func gcd(_ n1: Int, _ n2: Int) -> Int64 {
    var result: Int = 0
    for i in (1...min(n1, n2)).reversed() {
        if n1 % i == 0 && n2 % i == 0 {
            result = i
            break
        }
    }
    return Int64(result)
}
