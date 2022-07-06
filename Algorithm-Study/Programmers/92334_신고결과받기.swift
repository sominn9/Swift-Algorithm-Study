//
//  92334_신고결과받기.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

func solution(_ id_list:[String], _ reports:[String], _ k:Int) -> [Int] {
    var user_dic: [String: [String]] = [:] // {유저 ID: [유저가 신고한 ID]}
    var ban_dic: [String: Int] = [:]  // {신고된 유저 ID: 신고된 횟수}
    
    Set(reports).forEach {
        let splited = $0.components(separatedBy: " ")
        user_dic[splited[0], default: []].append(splited[1])
        ban_dic[splited[1], default: 0] += 1
    }
    
    let result: [Int] = id_list.map { id in
        return (user_dic[id] ?? []).reduce(0) { sum, ban_id in
            return sum + ((ban_dic[ban_id] ?? 0) >= k ? 1 : 0)
        }
    }
    return result
}
