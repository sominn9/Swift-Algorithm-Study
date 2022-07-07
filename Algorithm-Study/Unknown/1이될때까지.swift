//
//  1이될때까지.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

/*
 최대한 많이 나누는 것이 관건!
 
 (정당성 분석)
 K가 2 이상이면, K로 나누는 것이 1을 빼는 것보다 항상 빠르게 N을 줄일 수 있다.

 예) 입력: 25 7 -> 출력: 7
 
 알고리즘 분류: 그리디
 */

let input: String = readLine()!
let result: [Int] = input.split(separator: " ").map{ Int(String($0))! }

var N: Int = result[0]
let K: Int = result[1]
var count: Int = 0

while N != 1 {
    count += (N % K)
    N = N - (N % K)
    
    if N < K { break }
    
    count += 1
    N /= K
}

count += (N - 1)
print(count)
