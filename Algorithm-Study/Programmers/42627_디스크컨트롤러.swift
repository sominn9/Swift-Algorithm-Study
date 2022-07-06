//
//  42627_디스크컨트롤러.swift
//  Algorithm-Study
//
//  Created by 신소민 on 2022/07/07.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let total: Int = jobs.count
    var result: Int = 0
    var end_time: Int = 0

    var jobs = jobs.sorted(by: {
         if $0[0] != $1[0] {
             return $0[0] < $1[0]
         }
         return $0[1] < $1[1]
     })

    while !jobs.isEmpty {
        // 어떤 작업을 처리할 지 선택
        let temp: [[Int]] = jobs.filter { job in
            return job[0] <= end_time
        }.sorted(by: {
            if $0[1] != $1[1] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        })
        let job: [Int] = temp.isEmpty ? jobs[0] : temp[0]
        jobs.remove(at: jobs.firstIndex(of: job)!)

        // 기다린 시간 = (앞의 작업이 끝난 시점 - 작업이 요청되는 시점)
        var wait_time: Int = 0
        if end_time > job[0] {
            wait_time = end_time - job[0]
        }

        // 요청에서 종료까지 = (기다린 시간 + 작업의 소요시간)
        result += (wait_time + job[1])

        // 작업이 끝난 시점 업데이트
        end_time = (end_time <= job[0]) ? job[0] + job[1] : end_time + job[1]
    }

    return result / total
}
