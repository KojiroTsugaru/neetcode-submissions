class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res = [[Int]]()

        // sort first
        var intervals = intervals.sorted { $0[0] < $1[0] }

        // if currentEnd >= nextStart -> merge
        // update current with [currentStart, max(currentEnd, nextEnd)]
        // go to next
        var curInter = intervals[0]

        for i in 1..<intervals.count {
            // merge case
            if curInter[1] >= intervals[i][0] {
                curInter = [curInter[0], max(curInter[1], intervals[i][1])]
            } else {
                res.append(curInter)
                curInter = intervals[i]
            }
        }
        
        res.append(curInter)
        return res
    }
}
