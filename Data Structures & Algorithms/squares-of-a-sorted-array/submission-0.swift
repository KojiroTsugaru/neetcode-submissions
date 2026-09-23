class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var l = 0
        var r = n - 1
        var res = Array(repeating: 0, count: n)
        var resIndex = n - 1

        while l <= r {
            if nums[l] * nums[l] > nums[r] * nums[r] {
                res[resIndex] = nums[l] * nums[l]
                l += 1
            } else {
                res[resIndex] = nums[r] * nums[r]
                r -= 1
            }
            resIndex -= 1
        }

        return res
    }
}
