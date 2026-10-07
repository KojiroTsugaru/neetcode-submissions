class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }

        let c1 = Array(s1)
        let c2 = Array(s2)

        var target = [Character: Int]()
        var window = [Character: Int]()

        for c in c1 {
            target[c, default: 0] += 1
        }

        var l = 0

        for r in 0..<c2.count {
            window[c2[r], default: 0] += 1

            if r - l + 1 > c1.count {
                window[c2[l]]! -= 1

                if window[c2[l]] == 0 {
                    window.removeValue(forKey: c2[l])
                }

                l += 1
            }

            if window == target {
                return true
            }
        }

        return false
    }
}