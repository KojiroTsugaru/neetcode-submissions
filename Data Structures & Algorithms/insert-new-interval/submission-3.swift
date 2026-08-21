class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // sort internvals by start time
        /*
        Overwraped case:
        if start time > interval.start && start time < interval.end

        -> update new interval
        newInterval = min(start, intenval.start), max(end, inteval.end)

        else (no overwrapped):
        Add the current interval to result array
        */

        var res = [[Int]]()
        var newInter = newInterval
        
        for i in 0..<intervals.count {
            let inter = intervals[i]

            if newInter[1] < inter[0] {
                res.append(newInter)
                res.append(contentsOf: intervals[i...])
                return res
            } else if newInter[0] > inter[1] {
                res.append(inter)
            } else {
                newInter = [min(newInter[0], inter[0]), max(newInter[1], inter[1])]
            }
        }

        res.append(newInter)
        return res
    }
}
