class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let chars = Array(s)

        let mp: [Character: Character] = ["]": "[", "}": "{", ")": "("]

        for c in chars {
            if let openP = mp[c] {
                guard !stack.isEmpty && openP == stack.last! else { return false }
                stack.popLast()
            } else {
                stack.append(c)
            }
        }

        return stack.isEmpty
    }
}
