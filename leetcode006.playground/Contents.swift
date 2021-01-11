import UIKit

/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    class func convert(_ s: String, _ numRows: Int) -> String {
        //特殊情况处理
        if numRows >= s.count {
            return s
        }
        
        if numRows == 1 {
            return s
        }
        
        //除数
        let divisor: Int = 2*numRows-2
        //创建一维的字符串数组，用于保存数据
        var strArray: [String] = [String](repeating: "", count: numRows)
        //遍历字符串
        for (index, character) in s.enumerated() {
            let remainder = index % divisor
            if remainder < numRows {
                strArray[remainder].append(character)
            } else {
                strArray[divisor-remainder].append(character)
            }
        }
        return strArray.joined()
    }
}

print(Solution.convert("PAYPALISHIRING", 4))
