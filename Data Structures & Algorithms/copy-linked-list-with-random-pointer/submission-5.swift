/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var oldToNew = [Node?: Node?]() // { oldNode: newNode }

        // 1st pass
        // first create copy and put them into oldToNew
        var cur = head
        while cur != nil {
            let newNode = Node(cur!.val)
            oldToNew[cur!] = newNode
            cur = cur!.next
        }

        // 2nd pass
        // go through the list again to point next and random

        cur = head
        while cur != nil {
            let newNode = oldToNew[cur]!
            newNode?.next = oldToNew[cur!.next] ?? nil
            newNode?.random = oldToNew[cur!.random] ?? nil
            cur = cur!.next
        }

        return oldToNew[head] ?? nil
    }
}
