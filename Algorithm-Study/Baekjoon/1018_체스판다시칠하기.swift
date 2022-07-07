//
//  1018_체스판다시칠하기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

// M * N 보드를 잘라서 8 * 8 체스판을 만들 때 다시 칠해야 하는 정사각형의 최소 개수 구하기
let size: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (size[0], size[1])

var board: [[Character]] = []
for _ in 0..<n {
    board.append(Array(readLine()!))
}

let patternWhite: [Character] = Array("BWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWB")
let patternBlack: [Character] = Array("WBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBWWBWBWBWBBWBWBWBW")
var result: Int = Int.max

for row in 0...(n-8) {
    for col in 0...(m-8) {
        let chessboard = board[row..<row+8].map { Array($0[col..<col+8]) }
        let pattern: [Character] = chessboard.flatMap { $0 }
        
        var differenceW: Int = 0, differenceB: Int = 0
        for i in 0..<64 {
            if patternWhite[i] != pattern[i] { differenceW += 1 }
            if patternBlack[i] != pattern[i] { differenceB += 1 }
        }
        result = min(differenceW, differenceB, result)
    }
}

print(result)
