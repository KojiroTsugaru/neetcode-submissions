class RandomizedSet {

    var numMap: [Int: Int] // val: index in nums
    var nums: [Int]

    init() {
        self.numMap = [:]
        self.nums = []
    }

    func insert(_ val: Int) -> Bool {
        guard numMap[val] == nil else { return false }
        numMap[val] = self.nums.count
        nums.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let idx = numMap[val] else { return false }
        
        let lastNum = nums[nums.count - 1]
        nums[idx] = lastNum
        numMap[lastNum] = idx
        nums.removeLast()
        numMap.removeValue(forKey: val)
        return true
    }

    func getRandom() -> Int {
        return nums[Int.random(in: 0..<nums.count)]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
