class Solution {
    func reverseString(_ s: inout [Character]) {
        
        var l = 0 
        var r = s.count - 1

        while l < r {
            let temp = s[l]
            s[l] = s[r]
            s[r] = temp

            l += 1
            r -= 1
        }
    }
}
