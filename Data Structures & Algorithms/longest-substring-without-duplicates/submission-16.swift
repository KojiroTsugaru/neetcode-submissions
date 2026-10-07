class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res = 0
        var l = 0
        var lastSeen = [Character: Int]() // [char: lastSeen index]
        let chars = Array(s)
        for r in 0..<chars.count {
            let char = chars[r]
            if let lastIndex = lastSeen[char] {
                l = max(l, lastIndex + 1)
            }
            res = max(res, r - l + 1)
            lastSeen[char] = r
        }

        return res
    }
}
