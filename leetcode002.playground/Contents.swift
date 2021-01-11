import UIKit

/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p1 = l1
        var p2 = l2
        
        let head = ListNode(-1)
        var tail: ListNode? = head
        
        var carry: Int = 0
        
        while p1 != nil || p2 != nil {
            let sum: Int = (p1 != nil ? p1!.val : 0) + (p2 != nil ? p2!.val : 0) + carry
            
            if p1 != nil {
                p1 = p1!.next
            }
            
            if p2 != nil {
                p2 = p2!.next
            }
            
            let num: Int = sum % 10
            carry = sum / 10
        
            tail!.next = ListNode(num)
            tail = tail!.next
        }
        
        if carry == 1 {
            tail!.next = ListNode(1)
        }
        
        return head.next
    }
}
