class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        /*
        if we alrady find prefix sum that
        curSum - k = prefixSum
        */

        var prefixSums = [Int: Int]() // { prefixSum: Count }
        // pretend that we alrady found 1 prefixSum that sums up to 0
        prefixSums[0] = 1

        var res = 0

        var curSum = 0
        for n in nums {
            curSum += n

            if let count = prefixSums[(curSum - k)] {
                res += count
            }

            prefixSums[curSum, default: 0] += 1
        }

        return res
    }
}
