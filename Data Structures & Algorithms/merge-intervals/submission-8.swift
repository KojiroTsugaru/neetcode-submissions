class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // sort intervals -> we ensure intervals[i][0] < intervals[i+1][0]

        // merge conditions:
        // intervals[i][1] >= intervals[i+1][0]

        var intervals = intervals
        intervals.sort { $0[0] < $1[0] }
        var res = [[Int]]()

        var curStart = intervals[0][0], curEnd = intervals[0][1]

        for i in 1..<intervals.count {
            let start = intervals[i][0], end = intervals[i][1]
            
            // merge case
            if curEnd >= start {
                curEnd = max(curEnd, end)
            } else {
                res.append([curStart, curEnd])
                curStart = start
                curEnd = end
            }
        }

        res.append([curStart, curEnd])

        return res
    }
}
