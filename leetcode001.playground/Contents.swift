import UIKit

/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [Int: Int]()
        for (i, v) in nums.enumerated() {
            if let index = dict[target-v] {
                return [index, i]
            }
            dict[v] = i
        }
        return []
    }
}

//注意点：
//1、使用数组一次遍历即可
//2、判断target-v是否在数组中，若不再，则将i（作为value）与v（作为索引key）置于数组当中
