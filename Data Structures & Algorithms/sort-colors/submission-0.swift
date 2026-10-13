class Solution {
    func sortColors(_ nums: inout [Int]) {
        var l = 0, r = nums.count - 1
        var i = 0

        while i <= r {
            if nums[i] == 0 {
                let temp = nums[l]
                nums[l] = nums[i]
                nums[i] = temp
                l += 1
            }
            else if nums[i] == 2 {
                let temp = nums[r]
                nums[r] = nums[i]
                nums[i] = temp
                r -= 1
                i -= 1
            }
            i += 1
        }
    }
}
