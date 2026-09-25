class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // 26 alphabet char only

        var groups = [[Int]: [String]]()

        for s in strs {
            let chars = Array(s)
            var count = Array<Int>(repeating: 0, count: 26)

            for c in chars {
                // ascii val of 'a'=97
                count[Int(c.asciiValue!) - 97] += 1
            }

            
            groups[count, default: []].append(s)
        }

        return Array(groups.values)
    }
}
