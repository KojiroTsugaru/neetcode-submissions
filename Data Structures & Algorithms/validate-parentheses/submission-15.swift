class Solution {
    func isValid(_ s: String) -> Bool {
        // use stack

        var stack = [Character]()

        // if close parenthesis is found, check top of the stack
        // if it's match with the same type of parenthesis + open,
        // pop it from the stack

        // otherwise, it's invalid so immidately return false

        let closeToOpen: [Character: Character] = ["]": "[", "}": "{", ")": "("]
        let chars = Array(s)

        for c in chars {
            if let openP = closeToOpen[c] {
                if stack.last == openP {
                    _ = stack.popLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }
        }

        return stack.isEmpty
    }
}
