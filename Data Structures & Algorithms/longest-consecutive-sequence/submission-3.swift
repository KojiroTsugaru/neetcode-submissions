class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set<Int>(nums)
        var res = 0

        for n in nums {
            var length = 1

            // check if n is the start of a sequence
            if !numSet.contains(n - 1) {
                while numSet.contains(n + length) {
                    length += 1
                }

                res = max(res, length)
            }
        }

        return res
    }
}
