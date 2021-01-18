import UIKit

/*
 * @lc app=leetcode.cn id=11 lang=swift
 *
 * [11] 盛最多水的容器
 */

class Solution {
    class func maxArea(_ height: [Int]) -> Int {
        //特殊情况处理
        guard height.count > 1 else {
            return 0
        }
        
        //记录最大值
        var result: Int = 0
        //左右索引位置
        var left: Int = 0
        var right: Int = height.count - 1
        
        while left < right {
            let leftH: Int = height[left]
            let rightH: Int = height[right]
            
            if leftH < rightH {
                result = max((right - left) * leftH, result)
                //左侧为短板，需向右移动
                left += 1
                while height[left] < leftH, left < right {
                    left += 1
                }
            } else {
                result = max((right - left) * rightH, result)
                //右侧为短板，需向左移动
                right -= 1
                while height[right] < rightH, left < right {
                    right -= 1
                }
            }
        }
        
        return result
    }
}

print(Solution.maxArea([1,8,6,2,5,4,8,3,7]))
