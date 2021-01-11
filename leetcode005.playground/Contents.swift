import UIKit

/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

extension String {

    var length: Int {
        return count
    }

    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript(r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

//解法一：暴力方法求解
//class Solution {
//    func longestPalindrome(_ s: String) -> String {
//        //特殊情况处理
//        if s.count < 2 {
//            return s
//        }
//
//        //最大回文子串的起始位置
//        var startPos: Int = 0
//        //最大回文子串的长度
//        var maxLength: Int = 1
//
//        for i in 0...s.count-2 {
//            for j in (i+1)..<s.count {
//                if (j - i + 1) > maxLength && isPalindrome(s, start: i, end: j) {
//                    maxLength = j - i + 1
//                    startPos = i
//                }
//            }
//        }
//
//        print("startPos = \(startPos) maxLength = \(maxLength)")
//
//        //截取最长子串
//        let start = s.index(s.startIndex, offsetBy: startPos)
//        let end = s.index(start, offsetBy: maxLength - 1)
//        return String(s[start...end])
//    }
    
//    //判断字符串是否为回文字符串
//    func isPalindrome(_ s: String, start: Int, end: Int) -> Bool {
//        var head: Int = start
//        var tail: Int = end
//        var flag: Bool = true
//        while head < tail {
//            if s[head] != s[tail] {
//                flag = false
//                break
//            }
//            head += 1
//            tail -= 1
//        }
//        return flag
//    }
//}

//print(Solution.longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"))

//解法二：中间扩展法
//class Solution {
//    class func longestPalindrome(_ s: String) -> String {
//        //特殊情况处理
//        if s.count < 2 {
//            return s
//        }
//
//        //将s转换成数组，方便处理
//        let array: [Character] = Array(s)
//        //最大回文子串的起始位置
//        var startPos: Int = 0
//        //回文子串的最大长度
//        var maxLength: Int = 1
//
//        var index = 0
//        while index < s.count - 1 {
//            let result = findLongestPalindrome(array, start: index)
//            if result.maxLength > maxLength {
//                startPos = result.startPos
//                maxLength = result.maxLength
//            }
//            //更新下一次开始中间扩展的位置
//            index = result.newStart
//            index += 1
//
//            //优化: 当前位置进行中间扩展的最长子串 小于等于 当前最长回文子串时，结束循环
//            if ((s.count - index) * 2 - 1) <= maxLength {
//                break
//            }
//        }
//
//        //截取最长子串
//        let start = s.index(s.startIndex, offsetBy: startPos)
//        let end = s.index(start, offsetBy: maxLength - 1)
//        return String(s[start...end])
//    }
//
//    class func findLongestPalindrome(_ array: [Character], start: Int) -> (newStart: Int, startPos: Int, maxLength: Int) {
//        var low = start, high = start
//
//        //处理相邻且相同的字符（"aa"与"aaa"）一并处理
//        while high + 1 < array.count && array[high+1] == array[low] {
//            high += 1
//        }
//        let ans = high
//
//        while low - 1 >= 0 && high + 1 < array.count && array[low-1] == array[high+1] {
//            high += 1
//            low -= 1
//        }
//
//        return (ans, low, high - low + 1)
//    }
//}


//解法三：动态规划
class Solution {
    func longestPalindrome(_ s: String) -> String {
        //特殊情况处理
        if s.count < 2 {
            return s
        }
        
        //构建一个s.count * s.count的二维数组
        var array2D = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        //最长回文子串的起始位置
        var startPos: Int = 0
        //最长回文子串的长度
        var maxLength: Int = 1
        //String转成数组，方便处理
        let array = Array(s)
        
        for j in 0 ..< s.count {
            for i in 0 ..< j {
                if array[i] != array[j] {
                    array2D[i][j] = false
                } else {
                    if j - i < 3 {
                        array2D[i][j] = true
                    } else {
                        array2D[i][j] = array2D[i+1][j-1]
                    }
                }
                //记录最大长度与起始位置
                if array2D[i][j] && (j-i+1) > maxLength  {
                    maxLength = j-i+1
                    startPos = i
                }
            }
        }
        
        //截取最长子串
        let start = s.index(s.startIndex, offsetBy: startPos)
        let end = s.index(start, offsetBy: maxLength - 1)
        return String(s[start...end])
    }
}


