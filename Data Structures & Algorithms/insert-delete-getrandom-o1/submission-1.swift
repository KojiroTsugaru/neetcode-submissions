class RandomizedSet {
    var nums: [Int]
    var numMap: [Int: Int]

    init() {
        self.nums = [Int]()
        self.numMap = [:]
    }

    func insert(_ val: Int) -> Bool {
        if numMap[val] != nil {
            return false
        }
        
        nums.append(val)
        numMap[val] = nums.count - 1
        return true
    }

    func remove(_ val: Int) -> Bool {
        // get index of removing val in nums array
        guard let idx = numMap[val] else { return false }
        
        // copy the last element of array into the removing val's index
        let last = nums[nums.count - 1]
        nums[idx] = last
        numMap[last] = idx

        // removing the last element -> O(1)
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
