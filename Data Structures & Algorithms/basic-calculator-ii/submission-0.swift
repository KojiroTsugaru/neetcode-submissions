class Solution {
    func calculate(_ s: String) -> Int {
        // + or - -> put them in stack
        // * or / -> calculate immediately
        let s = s.replacingOccurrences(of: " ", with: "")
        var stack = [Int]()
        let chars = Array(s)
        var num = 0
        var operation: Character = "+"

        for i in 0..<chars.count {
            let ch = chars[i]
            if ch.isNumber {
                num = num * 10 + Int(String(ch))!
            }

            if !ch.isNumber || i == chars.count - 1 {
                switch operation {
                    case "+":
                        stack.append(num)
                    case "-":
                        stack.append(-num)
                    case "*":
                        let lastNum = stack.removeLast()
                        stack.append(lastNum * num)
                    case "/":
                        let lastNum = stack.removeLast()
                        stack.append(lastNum / num)
                    default:
                        break
                }
                operation = ch
                num = 0
            }
        }
        return stack.reduce(0, +)
    }
}
