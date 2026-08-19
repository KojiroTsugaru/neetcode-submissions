class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // sliding windows
        // use map to store the index of char
        /*
        // if let lastFonud = map[c] {
            l = lastFound + 1
            map[c] = i
        }
        */
        
        var l = 0
        var lastFoundMap = [Character: Int]()
        var res = 0
        let chars = Array(s)

        for r in 0..<chars.count {
            if let lastFound = lastFoundMap[chars[r]] {
                l = max(lastFound + 1, l)
            }
            
            res = max(res, r - l + 1)
            lastFoundMap[chars[r]] = r
        }

        return res

        /*
        s="abba"
        r=0: {"a": 0}, res = 1, l=0
        r=1: {"a": 0, "b": 1}, res =2, l=0
        r=2" {"a": 0, "b": 1}, l=2, res=2
        */
    }
}
