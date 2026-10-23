class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = (l + r) / 2      
            
            if nums[m] == target {
                return m
            }
            else if nums[l] <= nums[m] { // left half is sorted
                if nums[l] <= target && target < nums[m] {
                    // go to left
                    r = m - 1
                } else {
                    // go to right
                    l = m + 1
                }
            } 
            else { // right half is sorted
                if nums[m] < target && target <= nums[r] {
                    // go to right
                    l = m + 1
                } else {
                    // go to left
                    r = m - 1
                }
            }
        }

        return -1
    }
}
