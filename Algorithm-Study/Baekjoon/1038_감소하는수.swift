//
//  1038_감소하는수.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

let n: Int = Int(readLine()!)!
var numbers: [Int] = [Int](1...9)

func check(_ n: Int) -> Int {
    guard n != 0 else { return 0 }
    
    var index: Int = 0
    while index < numbers.count {
        guard index != (n - 1) else { return numbers[index] }
        
        let curNumber = numbers[index]
        for unit in 0..<(curNumber % 10) {
            let newNumber = curNumber * 10 + unit
            numbers.append(newNumber)
        }
        
        index += 1
    }
    return -1
}

print(check(n))
