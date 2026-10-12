class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var tCounter = [Character: Int]()
        let tChars = Array(t)
        var need = 0

        for c in tChars {
            tCounter[c, default: 0] += 1
            need += 1
        }
        var inds = [0, 0]
        var resLength = Int.max

        let sChars = Array(s)
        var l = 0
        for r in 0..<sChars.count {
            let char = sChars[r]
            if let count = tCounter[char] {
                tCounter[char]! -= 1
                if count > 0 {
                    need -= 1
                }
            }

            while need == 0 {
                if (r - l + 1) < resLength {
                    inds = [l, r]
                    resLength = r - l + 1
                }

                if let cnt = tCounter[sChars[l]] {
                    if cnt >= 0 {
                        need += 1
                    }
                    tCounter[sChars[l]]! += 1
                }
                l += 1
            }
        }

        return resLength == Int.max ? "" : String(sChars[inds[0]...inds[1]])
    }
}
