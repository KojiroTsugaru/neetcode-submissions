class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var res = 0

        for n in numSet {
            // ensure n is the start of the sequence
            if !numSet.contains(n - 1) {
                var cnt = 1
                
                while numSet.contains(n + cnt) {
                    cnt += 1
                }

                res = max(res, cnt)
            }
        }
        return res
    }
}
