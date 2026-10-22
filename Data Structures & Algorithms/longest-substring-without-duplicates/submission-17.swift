class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)

        var windowSet = Set<Character>()
        var res = 0
        var l = 0
        for r in 0..<chars.count {
            let char = chars[r]

            while windowSet.contains(char) {
                windowSet.remove(chars[l])
                l += 1
            }
            windowSet.insert(char)
            res = max(res, r - l + 1)
        }

        return res
    }
}
