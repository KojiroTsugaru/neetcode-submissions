class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        // sliding window

        let chars = Array(s)
        
        var l = 0
        var longestLength = 0
        var found = [Character: Int]() // [char: last found index]
        for r in 0..<chars.count {
            
            if let foundIndex = found[chars[r]] {
                l = max(l, foundIndex + 1)
            }
            longestLength = max(longestLength, r - l + 1)
            found[chars[r]] = r
        }

        return longestLength
    }
}

