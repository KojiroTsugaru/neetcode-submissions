class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        
        let chars = Array(s)
        var tCount = [Character:Int]()
        for c in Array(t) {
            tCount[c, default: 0] += 1
        }

        let need = tCount.count
        var have = 0
        var res = ""
        var minLen = Int.max
        var resL = -1
        var resR = -1

        var l = 0
        for r in 0..<chars.count {
            if tCount[chars[r]] != nil {
                tCount[chars[r]]! -= 1
                if tCount[chars[r]]! == 0 {
                    have += 1
                }
            }

            while have == need {
                if (r - l + 1) < minLen {
                    minLen = r - l + 1
                    resL = l
                    resR = r
                }
                if tCount[chars[l]] != nil {
                    if tCount[chars[l]]! == 0 {
                        have -= 1
                    }
                    tCount[chars[l]]! += 1
                }

                l += 1
            }
        }

        if resL == -1 {
            return ""
        }

        return String(chars[resL...resR])
    }
}