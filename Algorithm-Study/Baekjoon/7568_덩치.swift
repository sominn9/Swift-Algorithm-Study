//
//  7568_덩치.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

struct Person {
    let weight: Int
    let height: Int
}

let n = Int(readLine()!)!
var personArr: [Person] = []

for _ in 0..<n {
    let arr: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    personArr.append(Person(weight: arr[0], height: arr[1]))
}

// 덩치 등수 = (자신보다 더 큰 덩치의 사람의 수) + 1
var rank: [Int] = []
for person in personArr {
    let comparison = personArr.filter {
        $0.weight > person.weight && $0.height > person.height
    }
    rank.append(comparison.count + 1)
}

let result: String = rank.reduce("") { $0 + "\($1) " }
print(result.dropLast())
