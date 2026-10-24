class TimeMap { 
    private var timeMap: [String: [(time: Int, val: String)]]

    init() {
        self.timeMap = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        self.timeMap[key, default: []].append((timestamp, value))
    }   

    func get(_ key: String, _ timestamp: Int) -> String {
        // if there are multiple values return val with largest timestamp_prev
        var res = ""
        if let items = self.timeMap[key] {
            var l = 0
            var r = items.count - 1

            while l <= r {
                let mid = (l + r) / 2

                if items[mid].time <= timestamp {
                    res = items[mid].val
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }

        return res
    }
}
