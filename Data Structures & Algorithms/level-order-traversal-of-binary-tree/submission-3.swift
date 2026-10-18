/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()

        var q = [TreeNode]()
        guard root != nil else { return [] }

        q.append(root!)

        while !q.isEmpty {
            var level = [Int]()
            for _ in 0..<q.count {
                let node = q.removeFirst()
                level.append(node.val)

                if let left = node.left {
                    q.append(left)
                }

                if let right = node.right {
                    q.append(right)
                }
            }

            res.append(level)
        }

        return res
    }
}
