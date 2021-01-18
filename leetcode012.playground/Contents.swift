import UIKit

/*
 * @lc app=leetcode.cn id=12 lang=swift
 *
 * [12] 整数转罗马数字
 */

class Solution {
    class func intToRoman(_ num: Int) -> String {
        //特殊情况处理
        if num <= 0 || num >= 4000 {
            return ""
        }
        
        var num: Int = num
        let dict: [[String]] = [
            ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],
            ["", "M", "MM", "MMM"]
        ]
        
        let thousand: Int = num / 1000
        num = num % 1000
        
        let hundred: Int = num / 100
        num = num % 100
        
        let ten: Int = num / 10
        num = num % 10
        
        return dict[3][thousand] + dict[2][hundred] + dict[1][ten] + dict[0][num]
    }
}

print(Solution.intToRoman(3))
