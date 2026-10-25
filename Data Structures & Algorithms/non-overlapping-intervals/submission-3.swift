class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] }

        /*
        if there is overwrap, always remove the interval with larger end value

        -> that will minimize the future over wrapping

        keep track of the previous intervals


        intervals=[[1,2],[2,4],[1,4]]

        -> sorted

        intervals=[[1,2],[1,4],[2,4]]

        */
        var count = 0
        var prevInterval = intervals[0]
        for i in 1..<intervals.count {
            let curInterval = intervals[i]
            // overwrap
            if curInterval[0] < prevInterval[1] {
                if prevInterval[1] > curInterval[1] {
                    prevInterval = curInterval
                }
                count += 1
            } else {
                prevInterval = curInterval
            }
        }

        return count
    }
}
