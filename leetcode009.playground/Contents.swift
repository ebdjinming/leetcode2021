import UIKit

/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

//解法一
//class Solution {
//    class func isPalindrome(_ x: Int) -> Bool {
//        if x < 0 {
//            return false
//        }
//        
//        var result: Int = 0
//        var rev: Int = x
//        while rev != 0 {
//            result = result * 10 + rev % 10
//            rev = rev / 10
//        }
//        
//        return result == x
//    }
//}

//解法二
class Solution {
    class func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        
        let array: [Character] = Array(String(x))
        var left: Int = 0
        var right: Int = array.count - 1
        while left < right {
            if array[left] != array[right] {
                return false
            }
            left += 1
            right -= 1
        }
        
        return true
    }
}

print(Solution.isPalindrome(12231))
