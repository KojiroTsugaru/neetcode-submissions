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
    func maxDepth(_ root: TreeNode?) -> Int {
        var res = 0

        func dfs(_ node: TreeNode?, _ height: Int) {
            guard let node = node else { return }

            let height = height + 1
            res = max(res, height)

            dfs(node.left, height)
            dfs(node.right, height)

            return
        }

        dfs(root, 0)
        return res
    }
}
