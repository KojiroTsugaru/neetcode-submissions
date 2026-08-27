class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        
        var l = 0
        var r = heights.count - 1

        var res = 0

        while l < r {
            let area = min(heights[l], heights[r]) * (r - l)
            res = max(res, area)

            if heights[l] > heights[r] {
                r -= 1
            } else {
                l += 1
            }
        }
        return res
    }
}
