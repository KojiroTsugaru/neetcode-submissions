class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        
        // end when l == r
        while l < r {
            let m = (l + r) / 2

            if nums[m] < nums[r] {
                // right half is sorted
                // which means the min is in left half
                r = m
            } else {
                // we can exclude m because we know there is at least one
                // element that is smaller than nums[m] which is nums[r]
                l = m + 1
            }
        }

        return nums[r]

        //　[3,4,5,6,1,2]
    }
}
