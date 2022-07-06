//
//  문자열재정렬.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/06.
//

import Foundation

// (알파벳 + 숫자)순으로 문자열 정렬하기
let str: String = readLine()!

let alphabetSorted: String = String(str.replacingOccurrences(of: "[^A-Z]", with: "", options: .regularExpression).sorted())
let numberSum: Int = Array<Character>(str.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression))
    .reduce(0) { $0 + $1.wholeNumberValue! }

let result: String = alphabetSorted + String(numberSum)

print(result)
