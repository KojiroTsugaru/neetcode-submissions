class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var mp = [Int: Int]()

        for (i, n) in nums.enumerated() {
            let comp = target - n

            if let index = mp[comp] {
                return [index, i]
            }

            mp[n] = i
        }
        return []
    }
}
