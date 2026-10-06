class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // cannot sort 
        // time has to be O(N)

        /*
        // use hash map to keep track of the longest consecutive 
        // sequence starting from n

        map [n: currentLength]


        for n in nums
        if n - 1 in map -> map[n] = map[n-1] + 1
        update maxLength

        else map[n] = 1
        */
        
        let numSet = Set(nums)
        var res = 0

        for n in numSet {
            if !numSet.contains(n - 1) {
                var length = 1
                while numSet.contains(n + length) {
                    length += 1
                }
                res = max(res, length)
            }
        }

        return res
    }   
}
