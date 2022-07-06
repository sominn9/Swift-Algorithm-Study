//
//  18312_시각.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

// 00시 00분 00초 ~ N시 59분 59초
let n = Int(readLine()!)!
var count = 0

for i in 0...n {
    for j in 0...59 {
        for k in 0...59 {
            if "\(i)\(j)\(k)".contains("3") {
                count += 1
            }
        }
    }
}

print(count)
