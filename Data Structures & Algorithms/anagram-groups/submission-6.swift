class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams = [Array<Int>: [String]]()

        for str in strs {
            let chars = Array(str)
            var counts = [Int](repeating: 0, count: 26)

            for c in chars {
                counts[Int(c.asciiValue!) - 97] += 1
            }
            
            anagrams[counts, default: []].append(str)
        }

        return Array(anagrams.values)
    }
}
