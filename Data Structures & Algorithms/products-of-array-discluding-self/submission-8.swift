class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var pres = Array(repeating: 1, count: nums.count)
        var posts = Array(repeating: 1, count: nums.count)

        var product = 1
        for i in 0..<nums.count {   
            pres[i] = product
            product *= nums[i]
        }

        product = 1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            posts[i] = product
            product *= nums[i]
        }

        var res = Array(repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            res[i] = pres[i] * posts[i]
        }

        return res
    }
}