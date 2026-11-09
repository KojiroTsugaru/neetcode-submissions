class RandomizedSet {

    var numMap: [Int: Int]
    var size: Int

    init() {
        self.numMap = [Int: Int]()
        self.size = 0
    }

    func insert(_ val: Int) -> Bool {
        guard numMap[val] == nil else { return false }
        numMap[val] = val
        size += 1
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard numMap[val] != nil else { return false }
        numMap.removeValue(forKey: val)
        size -= 1
        return true
    }

    func getRandom() -> Int {
        let vals = Array(numMap.keys)
        let idx = Int.random(in: 0..<size)
        return vals[idx]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
