//
//  60057_문자열압축.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/05.
//

import Foundation

func solution(_ s: String) -> Int {
    guard s.count != 1 else { return 1 }
    let s: [Character] = Array<Character>(s)
    var result: [Int] = []
    
    for unit in 1..<s.count {
        var encode: [String] = []
        var count: Int = 0
        
        encode.append(String(s[0..<unit]))
        count += 1
        for i in stride(from: unit, to: s.count, by: unit) {
            let current = String(s[i..<(i+unit >= s.count ? s.count : i+unit)])
            
            if encode.last! == current {
                count += 1
            } else {
                encode.insert(String(count), at: encode.count-1)
                encode.append(current)
                count = 1
            }
        }
        if encode.count % 2 != 0 {
            encode.insert(String(count), at: encode.count-1)
        }
        encode = encode.filter { $0 != "1" }
        result.append(encode.joined().count)
    }
    return result.min()!
}
