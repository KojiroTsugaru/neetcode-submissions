class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count

        var counter = [Int: Int]()

        for n in nums {
            counter[n, default: 0] += 1
        }

        var bucket = Array<[Int]>(repeating: [], count: n + 1)

        for (key, val) in counter {
            bucket[val].append(key)
        }

        var res = [Int]()
        for vals in bucket.reversed() {

            for val in vals {
                guard res.count < k else { return res }
                res.append(val)
            }
        }

        return res
    }
}
