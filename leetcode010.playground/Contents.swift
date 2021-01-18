import UIKit

/*
 * @lc app=leetcode.cn id=10 lang=swift
 *
 * [10] 正则表达式匹配
 */

class Solution1 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p == ".*" {
            return true
        }
        
        //字符串转数组，方便处理
        let arrayS: [Character] = Array(s)
        let arrayP: [Character] = Array(p)
        
        return isMatch(arrayS, arrayP, 0, 0)
    }
    
    func isMatch(_ arrayS: [Character], _ arrayP: [Character], _ s: Int, _ p: Int) -> Bool {
        //递归结束条件
        if p >= arrayP.count {
            return s >= arrayS.count
        }
        
        let firstMatch: Bool = (s < arrayS.count) && (arrayS[s] == arrayP[p] || arrayP[p] == ".")
        if (p+1) < arrayP.count && arrayP[p+1] == "*" {
            let newP = p + 2
            let newS = s + 1
            //* 可匹配零个（s, p+2）或者多个(s+1, p)
            return isMatch(arrayS, arrayP, s, newP) || (firstMatch && isMatch(arrayS, arrayP, newS, p))
        } else {
            let newS = s + 1
            let newP = p + 1
            return firstMatch && isMatch(arrayS, arrayP, newS, newP)
        }
    }
}

class Solution {
    class func isMatch(_ s: String, _ p: String) -> Bool {
        //字符串转数组，方便处理
        let s = Array((" "+s))
        let p = Array((" "+p))
        
        //构建dp数组 默认值为false
        var dp: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: p.count), count: s.count)
        dp[0][0] = true
        
        for i in 0 ..< s.count {
            for j in 1 ..< p.count {
                //？？？
                //当j指向'*'时, dp[i][j]只与dp[i][j-2]有关, 跳过了 dp[i][j-1]
                if(j + 1 < p.count && p[j + 1] == "*") {
                    continue
                }
                
                if p[j] != "*" {
                    dp[i][j] = i > 0 && (s[i] == p[j] || p[j] == ".") && dp[i-1][j-1]
                } else {
                    dp[i][j] = dp[i][j-2] || (i > 0 && (s[i] == p[j-1] || p[j-1] == ".") && dp[i-1][j])
                }
            }
        }
        return dp[s.count-1][p.count-1]
    }
}


print(Solution.isMatch("aabcce", "a.*ce"))


