class Solution {
    func compress(_ chars: inout [Character]) -> Int {

        var i = 0
        var count = 1

        for j in 1...chars.count {
            if j == chars.count || chars[j-1] != chars[j] {
                chars[i] = chars[j-1]
                i += 1

                if count > 1 {
                    let countString = String(count)
                    for str in Array(countString){
                        chars[i] = str
                        i += 1
                    }
                }
                count = 1
            } else {
                count += 1
            }
        }

        return i
    }
}
