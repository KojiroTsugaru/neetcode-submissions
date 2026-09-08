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
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var count = 0

        func dfs(_ node: TreeNode?, _ maxVal: Int) {
            guard let node = node else {
                return
            }

            if node.val >= maxVal {
                count += 1
            }

            dfs(node.left, max(maxVal, node.val))
            dfs(node.right, max(maxVal, node.val))
        }

        dfs(root, Int.min)
        return count   
    }
}
