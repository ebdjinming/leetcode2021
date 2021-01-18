import UIKit

class Solution {
    class func threeSum(_ nums: [Int]) -> [[Int]] {
        //特殊情况处理
        guard nums.count > 2 else { return [] }
        
        //排序处理
        let nums = nums.sorted()
        var result = [[Int]]()

        for i in 0 ..< nums.count-2 {
            if nums[i] > 0 {
                break
            }

            if i > 0 && nums[i] == nums[i - 1]  {
                // 过滤重复的数值
                continue
            }

            var left = i + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    //满足条件
                    result.append([nums[i], nums[left], nums[right]])
                    repeat {
                        left += 1
                    } while left < right && nums[left-1] == nums[left]

                    repeat {
                        right -= 1
                    } while right > left && nums[right] == nums[right+1]
                    continue
                }

                if sum < 0 {
                    repeat {
                        left += 1
                    } while left < right && nums[left-1] == nums[left]
                } else {
                    repeat {
                        right -= 1
                    } while right > left && nums[right] == nums[right+1]
                }
            }
        }
        return result
    }
}

print(Solution.threeSum([-2,0,1,1,2]))
