class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // prefix sum 
        var res = 0
        var prefixSums: [Int: Int] = [0: 1]
        
        var curSum = 0

        for n in nums {
            curSum += n
            let diff = curSum - k
            
            if let count = prefixSums[diff] {
                res += count
            }

            prefixSums[curSum] = prefixSums[curSum, default: 0] + 1
        }

        return res
    }
}
