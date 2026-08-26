class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        // use stack [(index, temp)]
        
        var stack = [(index: Int, temp: Int)]()
        var res = [Int](repeating: 0, count: temperatures.count)

        for (i, temp) in temperatures.enumerated() {
            while !stack.isEmpty && temp > stack.last!.temp {
                let (stackIndex, _) = stack.last!
                res[stackIndex] = i - stackIndex
                stack.removeLast()
            }

            stack.append((i, temp))
        }

        return res
    }
}
