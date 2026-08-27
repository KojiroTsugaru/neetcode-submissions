class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        // sliding window

        // minimal length of a subarray whose sum is greater than or equal to target

        var res = Int.max
        var curSum = 0

        var l = 0
        for r in 0..<nums.count {
            curSum += nums[r]
            
            while curSum >= target {
                res = min(res, r - l + 1)
                curSum -= nums[l]
                l += 1
            }
        }

        return res != Int.max ? res : 0
    }

    // sum = 14, res = 4 - 0 + 1 = 5
    // l += 1
    // sum = 12, res = 4
    // sum = 11, res = 3
    // sum = 6, res = 3
    // sum = 9, res = 3

}
