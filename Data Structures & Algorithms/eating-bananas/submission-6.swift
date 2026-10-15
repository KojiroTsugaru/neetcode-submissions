class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // max k possible is max(piles)

        // if k is too small
        // l = m + 1
        // if k is big enough
        // r = m - 1

        var l = 1
        var r = piles.max() ?? 0
        var res = Int.max

        while l <= r {
            var time = 0
            let rate = (l + r) / 2 // current rate

            for pile in piles {
                time += Int(ceil(Double(pile) / Double(rate)))
            }

            if time <= h {
                res = min(res, rate)
                r = rate - 1
            } else {
                l = rate + 1
            }
        }

        return res
    }
}