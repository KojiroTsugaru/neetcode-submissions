/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        let n = intervals.count
        let starts = intervals.map { $0.start }.sorted()
        let ends = intervals.map { $0.end }.sorted()

        // if current start is less than current end time, 
        // increment count by 1
        // take max of max count and current count
        
        var si = 0 // start index
        var ei = 0 // end index
        var count = 0
        var res = 0
        while si < n && ei < n {
            if starts[si] < ends[ei] {
                count += 1
                res = max(res, count)
                si += 1
            } else {
                ei += 1
                count -= 1
            }
        }

        return res
    }
}
