class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var newInterval = newInterval
        var res = [[Int]]()

        for interval in intervals {
            let start = interval[0]
            let end = interval[1]

            if end < newInterval[0] {
                // current is before newInterval
                res.append(interval)

            } else if start > newInterval[1] {
                // current is after newInterval
                res.append(newInterval)
                newInterval = interval

            } else {
                // overlap -> merge
                newInterval = [
                    min(start, newInterval[0]),
                    max(end, newInterval[1])
                ]
            }
        }

        res.append(newInterval)
        return res
    }
}