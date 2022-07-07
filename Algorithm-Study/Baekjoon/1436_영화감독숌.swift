//
//  1436_영화감독숌.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

let n: Int = Int(readLine()!)!
var nth: Int = 1
var number: Int = 666

func has666(_ number: Int) -> Bool {
    var temp = number
    while temp >= 666 {
        guard temp % 1000 != 666 else { return true }
        temp /= 10 // 일의 자리수 삭제
    }
    return false
}

while nth < n {
    number += 1
    if has666(number) {
        nth += 1
    }
}

print(number)
