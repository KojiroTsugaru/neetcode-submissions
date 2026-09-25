class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var curSum = 0
        var counts: [Int: Int] = [0: 1]
        var res = 0

        for n in nums {
            curSum += n
            let diff = curSum - k

            if let cnt = counts[diff] {
                res += cnt
            }  
        
            counts[curSum] = counts[curSum, default: 0] + 1
        }

        return res
    }
}
