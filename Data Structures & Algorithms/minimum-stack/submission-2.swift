class MinStack {

    // we need to keep track of the min element
    // at the time item was pushed


    var stack: [(Int, Int)] // (val, min at the time)
 
    init() {
        self.stack = [(Int, Int)]()
    }

    func push(_ val: Int) {
        let currentMin = stack.isEmpty ? val : min(stack.last!.1, val)
        stack.append((val, currentMin))
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        return self.stack.last!.0
    }
        
    func getMin() -> Int {
        return self.stack.last!.1
    }

}
