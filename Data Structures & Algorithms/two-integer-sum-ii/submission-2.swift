class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0, r = numbers.count - 1

        while l < r {
            let curSum = numbers[l] + numbers[r]

            if curSum > target {
                r -= 1
            } else if curSum < target {
                l += 1
            } else {
                return [l+1, r+1]
            }
        }
        return []
    }
}
