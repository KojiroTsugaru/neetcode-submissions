class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        var curSum = 0
        var l = 0
        var res = Int.max 

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
}
