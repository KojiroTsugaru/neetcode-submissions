class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set(nums)

        var res = 0

        for n in numSet {
            // ensure n is the start of the sequence
            if !numSet.contains(n - 1) {
                var cnt = 1
                var num = n
                
                while numSet.contains(num + 1) {
                    cnt += 1
                    numSet.remove(num)
                    num += 1
                }

                res = max(res, cnt)
            }
        }
        return res
    }
}
