import UIKit

/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

class Solution {
    class func myAtoi(_ s: String) -> Int {
        //用于存储最终结果
        var result: Int32 = 0
        //正负数判断标识
        var isNegative: Bool = false
        //判断字符转换是否开始
        var start: Bool = false
        
        for i in s {
            if !start {
                //字符转换还未开始
                if i == " " {
                    continue
                } else if i == "+" {
                    //以'+'开始
                    isNegative = false
                    start = true
                } else if i == "-" {
                    //以'-'开始
                    isNegative = true
                    start = true
                } else if !isNumber(char: i) {
                    // 以'.' 或 字母
                    break
                } else {
                    //以数字开始
                    start = true
                    result = (Int32(convertCharToInt(char: i)) - 48) * (isNegative ? -1 : 1)
                }
            } else {
                if !isNumber(char: i) {
                    break
                }
                
                let temp = result
                let num = Int32(convertCharToInt(char: i)) - 48
                if isNegative {
                    result = result &* 10 &- num
                } else {
                    result = result &* 10 &+ num
                }
                if result/10 != temp {
                    //数据溢出
                    result = isNegative ? Int32.min : Int32.max
                }
            }
        }
        
        return Int(result)
    }
    
    class func convertCharToInt(char: Character) -> Int {
        var result: Int = 0
        for i in String(char).unicodeScalars {
            result = Int(i.value)
        }
        return result
    }
    
    class func isNumber(char: Character) -> Bool {
        let num = convertCharToInt(char: char)
        if num >= 48 && num <= 57 {
            return true
        } else {
            return false
        }
    }
}

print (Solution.myAtoi("          -2147483648"))
