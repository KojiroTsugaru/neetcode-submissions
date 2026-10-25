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
    func reverseList(_ head: ListNode?) -> ListNode? {

        // traverse each node
        // make current node points to the prev node as its next
        var cur = head
        var prev: ListNode? = nil
        while cur != nil {
            let temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }

        return prev
    }
}
