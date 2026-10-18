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

        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node = node else { return }

            // if this is the first node reaches to this level
            // add an empty array
            if res.count == level {
                res.append([])
            }

            res[level].append(node.val)
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        }

        dfs(root, 0)
        return res
    }
}
