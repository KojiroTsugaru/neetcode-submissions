class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var groups = [[Int]: [String]]() // [char counts: [anagrams]]

        for s in strs {
            let chars = Array(s)
            var counts = Array(repeating: 0, count: 26)

            for c in chars {
                counts[Int(c.asciiValue!) - 97] += 1 // a -> 97 in ascii
            }

            groups[counts, default: []].append(s)
        }

        return Array(groups.values)
    }
}
