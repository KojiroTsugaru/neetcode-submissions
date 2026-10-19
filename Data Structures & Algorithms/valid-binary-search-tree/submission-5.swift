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
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        func dfs(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Bool {
            guard let node = node else { return true }

            if node.val <= minVal || node.val >= maxVal {
                return false
            }

            return dfs(node.left, minVal, node.val) && dfs(node.right, node.val, maxVal)
        }

        return dfs(root, Int.min, Int.max)
    }
}
