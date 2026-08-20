class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var prefix = [Int](repeating: 1, count: n)
        var postfix = [Int](repeating: 1, count: n)

        for i in 1..<n {
            prefix[i] = prefix[i-1] * nums[i-1]
        }

        for j in (0..<n-1).reversed() {
            postfix[j] = postfix[j+1] * nums[j+1]
        }

        var res = [Int](repeating: 0, count: n)

        for i in 0..<n {
            res[i] = prefix[i] * postfix[i]
        }

        return res
    }
}
