class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var countInWindow = [Character: Int]()
        var res = 0
        var maxf = 0
        let chars = Array(s)
        
        var l = 0
        for r in 0..<chars.count {
            countInWindow[chars[r]] = countInWindow[chars[r], default: 0] + 1
            maxf = max(maxf, countInWindow[chars[r]]!)

            // if (actual length) - maxf <= k
            // this is the max substring length

            // else: (actual length) - maxf > k
            // removing too many chars
            
            while (r - l + 1) - maxf > k {
                countInWindow[chars[l]]! -= 1
                l += 1
            }

            res = max(res, r - l + 1)
        }
        
        return res
    }
}
