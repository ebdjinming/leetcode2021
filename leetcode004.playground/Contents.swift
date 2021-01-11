import UIKit

/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count1 = nums1.count
        let count2 = nums2.count
        //特殊情况处理
        if count1 == 0 && count2 == 0 {
            return 0
        }
        
        if count1 == 0 && count2 == 1 {
            return Double(nums2[0])
        }
        
        if count2 == 0 && count1 == 1 {
            return Double(nums1[0])
        }
        
        if count1 == 1 && count2 == 1 {
            return (Double(nums1[0]) + Double(nums2[0])) / 2
        }
        
        //用于标识需要获取的元素个数
        //flag = 1 总个数为奇数个数，求解中位数，只需要一个值（index = n/2）
        //flag = 0 总个数为偶数个数，求解中位数，需要两个值的平均值(index = n/2-1, n/2)
        
        let n: Int = count1 + count2
        
        var p1: Int = 0
        var p2: Int = 0
        var array: [Int] = [Int]()
        
        for _ in 0...n/2 {
            if p1 >= count1 {
                //nums1数组已经遍历完毕，只遍历nums2
                array.append(nums2[p2])
                p2 += 1
            } else if p2 >= count2 {
                //nums2数组已经遍历完毕，只遍历nums1
                array.append(nums1[p1])
                p1 += 1
            } else if nums1[p1] < nums2[p2] {
                array.append(nums1[p1])
                p1 += 1
            } else {
                array.append(nums2[p2])
                p2 += 1
            }
        }
        
        if n % 2 == 1 {
            return Double(array[n/2])
        } else {
            return (Double(array[n/2-1]) + Double(array[n/2])) / 2
        }
    }
}
