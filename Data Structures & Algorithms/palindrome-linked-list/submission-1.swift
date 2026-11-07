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
        var stack = [Int]()

        var cur = head
        while cur != nil {
            stack.append(cur!.val)
            cur = cur!.next 
        }

        cur = head
        while cur != nil {
            if stack.removeLast() != cur!.val {
                return false
            }
            cur = cur!.next 
        }

        return true
    }   
}
