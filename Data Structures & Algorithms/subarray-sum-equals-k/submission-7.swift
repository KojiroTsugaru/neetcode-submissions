class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // prefix sum
        // brute force -> checking every single sub array sum

        var prefix = [Int: Int]() // {currentSum: count}
        prefix[0] = 1
        var res = 0

        var curSum = 0
        for n in nums {
            curSum += n
            
            // if there has been a subarray that sums up to curSum - targetVal
            // then just substract that sum from curSum
            // would get the target number

            if let cnt = prefix[curSum - k] {
                res += cnt
            }

            prefix[curSum] = prefix[curSum, default: 0] + 1
        }

        return res
    }
}
