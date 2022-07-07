//
//  곱하기혹은더하기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

/*
 (정당성 분석)
 대부분의 경우 '더하기' 보다는 '곱하기'가 값을 더 크게 만든다.
 
 예) 입력: 02984 -> 출력: 576
 
 알고리즘 분류: 그리디
 */

let input: String = readLine()!
let numbers: Array<Int> = Array<Character>(input).map { Int(String($0))! }

let result = numbers.reduce(0) { partialResult, nextNumber in
    if partialResult == 0 || nextNumber == 0 {
        return partialResult + nextNumber
    } else {
        return partialResult * nextNumber
    }
}

print(result)
