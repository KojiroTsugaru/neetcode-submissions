
class Solution {
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count

        var cache = [String: Int]()

        // rec(start, k) returns the minimum possible
        // largest sum when splitting nums[start...] into k parts
        func rec(_ start: Int, _ k: Int) -> Int {
            if k == 1 {
                return nums[start...].reduce(0, +)
            }

            let key = "\(start),\(k)"
            if let cached = cache[key] {
                return cached
            }

            var res = Int.max
            var splitSum = 0

            // Try every possible split point
            for i in start...(n - k) {
                splitSum += nums[i]

                let largestSum = max(
                    splitSum,
                    rec(i + 1, k - 1)
                )

                res = min(res, largestSum)
            }

            cache[key] = res
            return res
        }

        return rec(0, k)
    }
}