class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var lastSeen = [Character: Int]() // {char: lastSeen index}
        var res = 0
        var l = 0

        for r in 0..<chars.count {
            let char = chars[r]
            
            if let lastSeenIndex = lastSeen[char] {
                l = max(l, lastSeenIndex + 1)
            }

            lastSeen[char] = r
            res = max(res, r - l + 1)
        }

        return res
    }
}
