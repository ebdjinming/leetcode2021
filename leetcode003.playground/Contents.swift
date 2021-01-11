import UIKit

/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

class Solution {
    class func lengthOfLongestSubstring(_ s: String) -> Int {
        //长度为0，1的情况特殊处理
        if s.count <= 1 {
            return s.count
        }
        
        //字符及其最新的索引未知
        var dict: [Character: Int] = [Character: Int]()
        //滑动窗口左指针(右指针为index)
        var left: Int = -1
        //最大长度
        var maxLength: Int = 0
        
        for (index, char) in s.enumerated() {
            if dict[char] == nil {
                dict[char] = index
            } else {
                //left可能存在变小的情况，需加以判断
                left = dict[char]! > left ? dict[char]! : left
                dict[char] = index
            }
            //print("left = \(left) right = \(index)")
            maxLength = (index - left) > maxLength ? (index - left) : maxLength
        }
        
        return maxLength
    }
}

let length = Solution.lengthOfLongestSubstring("abba")
print(length)
