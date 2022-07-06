//
//  67256_키패드누르기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    // 왼손 위치, 오른손 위치, 결과 저장을 위한 변수 선언
    var l_hand: (y: Int, x: Int) = (3,0)
    var r_hand: (y: Int, x: Int) = (3,2)
    var result: String = ""
    
    // 키패드 위치 딕셔너리
    let keypad: [Int: (y: Int, x: Int)] = [
        1: (0,0), 2: (0,1), 3: (0,2),
        4: (1,0), 5: (1,1), 6: (1,2),
        7: (2,0), 8: (2,1), 9: (2,2),
        0: (3,1)
    ]
    
    // 루프하며 어떤 손이 눌러야 하는지 찾음
    var flag: String = ""
    
    numbers.forEach {
        if Set([1, 4, 7]).contains($0) {
            flag = "l"
        } else if Set([3, 6, 9]).contains($0) {
            flag = "r"
        } else {
            let l_distance = distance(l_hand, keypad[$0]!)
            let r_distance = distance(r_hand, keypad[$0]!)
            
            if l_distance != r_distance {
                flag = (l_distance < r_distance) ? "l" : "r"
            } else {
                flag = (hand == "left") ? "l" : "r"
            }
        }
        l_hand = (flag == "l") ? keypad[$0]! : l_hand
        r_hand = (flag == "l") ? r_hand : keypad[$0]!
        result = (flag == "l") ? result + "L" : result + "R"
    }

    return result
}

func distance(_ p1:  (y: Int, x: Int), _ p2: (y: Int, x: Int)) -> Int {
    return abs(p1.y - p2.y) + abs(p1.x - p2.x)
}
