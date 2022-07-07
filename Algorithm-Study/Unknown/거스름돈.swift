//
//  거스름돈.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

/*
 O(화폐의 개수) -> O(n)

 알고리즘의 시간 복잡도는 금액과는 무관하며, 화폐의 개수에만 영향을 받는다
 
 알고리즘 분류: 그리디
 */

var money: Int = 1260
var count: Int = 0

let unit: [Int] = [500, 100, 50, 10]

for coin in unit {
    count += (money / coin)
    money %= coin
}

print(count) // 6 (500 X 2, 100 X 2, 50 X 1, 10 X 1)
