class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // O(N^2)
        var res = Set<[Int]>()

        for i in 0..<nums.count {
            var mp = [Int: [Int]]() // [first + second: [first, second]]
            for j in (i+1)..<nums.count {
                if let firstAndSecond = mp[nums[j]] {
                    let sortedThreeSum = (firstAndSecond + [nums[j]]).sorted()
                    res.insert(sortedThreeSum)
                }

                let key = -nums[i] - nums[j]
                mp[key] = [nums[i], nums[j]]
            }
        }

        return Array(res)
    }
}
