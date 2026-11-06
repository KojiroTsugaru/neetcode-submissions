class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = (l + r) / 2
                        
            if m < nums.count - 1 && nums[m + 1] > nums[m] {
                l = m + 1
            } else if m > 0 && nums[m - 1] > nums[m] {
                r = m - 1
            } else {
                return m
            }
        }

        return -1
    }
}
