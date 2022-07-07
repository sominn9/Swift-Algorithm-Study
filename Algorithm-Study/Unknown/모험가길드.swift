//
//  모험가길드.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

/*
 (정당성 분석)
 공포도를 오름차순으로 정렬해서 각 그룹에 최소한의 모험가만 들어가도록 한다.
 
 알고리즘 분류: 그리디
 */

let numOfPeople: Int = Int(readLine()!)!
let fearArray: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var result: Int = 0
var count: Int = 0

for fear in fearArray {
    count += 1
    
    if count == fear {
        result += 1
        count = 0
    }
}

print(result)
