/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
        }

        // slow is now at the middle of the list
        // 1,2,3,4
        // 1,2,3,4,5,6

        // 1,2,3,4,5,6,7

        // even -> slow is at list.count/2 - 1 (len 4 -> 1, len 6 -> 2)

        // odd -> slow is at middle

        // reverse the second half
        var prev: ListNode? = nil
        var cur = slow
        while cur != nil {
            let temp = cur?.next
            cur?.next = prev
            prev = cur 
            cur = temp
        }

        var left = head
        var right = prev


        while right != nil {
            if left?.val != right?.val {
                return false
            }
            left = left?.next
            right = right?.next
        }
        
        return true
    }   
}
