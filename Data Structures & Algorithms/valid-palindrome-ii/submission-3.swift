class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var l = 0
        var r = s.count - 1


        func isPalindromeRange(_ left: Int, _ right: Int) -> Bool {
            var l = left
            var r = right
            while l < r {
                if chars[l] != chars[r] {
                    return false
                }
                l += 1
                r -= 1
            }
            return true
        }

        while l < r {
            if chars[l] != chars[r] {
                return isPalindromeRange(l + 1, r) || isPalindromeRange(l, r - 1)
            }
            l += 1
            r -= 1
        }

        return true
    }
}
