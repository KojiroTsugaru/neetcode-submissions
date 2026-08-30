class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // n * logn

        for i in 0..<numbers.count - 1 {
            var l = i + 1
            var r = numbers.count - 1
            let diff = target - numbers[i]

            while l <= r {
                let m = (l + r) / 2
                
                if numbers[m] > diff {
                    r = m - 1
                } else if numbers[m] < diff {
                    l = m + 1
                } else {
                    return [i + 1, m + 1]
                }
            }
        }

        return []
    }
}
