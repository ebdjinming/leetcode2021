import UIKit

/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

//解法一
//class Solution {
//    func reverse(_ x: Int) -> Int {
//        var result: Int32 = 0
//        var rev: Int32 = Int32(x)
//
//        while rev != 0 {
//            let remainder = rev % 10
//            //可能出现越界的情况，特殊处理
//            if result < Int32.min/10 || (result == Int32.min/10 && remainder < -8) {
//                return 0
//            }
//
//            if result > Int32.max/10 || (result == Int32.max/10 && remainder > 7) {
//                return 0
//            }
//
//            result = result * 10 + Int32(remainder)
//            rev = rev / 10
//        }
//
//        return Int(result)
//    }
//}


//解法二
class Solution {
    class func reverse(_ x: Int) -> Int {
        var result: Int32 = 0
        var rev: Int32 = Int32(x)

        while rev != 0 {
            let temp: Int32 = result
            result = result &* 10 &+ rev % 10
            //利用越界后数据不可控的特性 来判断是否越界
            if result/10 != temp {
                return 0
            }
            
            rev = rev / 10
        }

        return Int(result)
    }
}

print(Solution.reverse(2147483647))
