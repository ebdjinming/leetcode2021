import UIKit

/*
 * @lc app=leetcode.cn id=13 lang=swift
 *
 * [13] 罗马数字转整数
 */

class Solution {
    class func romanToInt(_ s: String) -> Int {
        //String转数组，方便处理
        let array = Array(s)
        var result: Int = 0
        var i: Int = 0
        
        while i < array.count {
            if array[i] == "M" {
                result += 1000
                i += 1
                continue
            }
            
            if array[i] == "D" {
                result += 500
                i += 1
                continue
            }
            
            if array[i] == "C" {
                if i+1 < array.count && array[i+1] == "D" {
                    result += 400
                    i += 2
                    continue
                }
                
                if i+1 < array.count && array[i+1] == "M" {
                    result += 900
                    i += 2
                    continue
                }
                
                result += 100
                i += 1
                continue
            }
            
            if array[i] == "L" {
                result += 50
                i += 1
                continue
            }
            
            if array[i] == "X" {
                if i+1 < array.count && array[i+1] == "L" {
                    result += 40
                    i += 2
                    continue
                }
                
                if i+1 < array.count && array[i+1] == "C" {
                    result += 90
                    i += 2
                    continue
                }
                
                result += 10
                i += 1
                continue
            }
            
            if array[i] == "V" {
                result += 5
                i += 1
                continue
            }
            
            if array[i] == "I" {
                if i+1 < array.count && array[i+1] == "V" {
                    result += 4
                    i += 2
                    continue
                }
                
                if i+1 < array.count && array[i+1] == "X" {
                    result += 9
                    i += 2
                    continue
                }
                
                result += 1
                i += 1
                continue
            }
        }
        
        return result
    }
}

print(Solution.romanToInt("MCMXCIV"))
