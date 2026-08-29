class Node {
    let val: Int
    let key: Int
    var left: Node?
    var right: Node?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    let capacity: Int
    var cache = [Int: Node]()
    let head: Node
    let tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity

        self.head = Node(-1, -1)
        self.tail = Node(-1, -1)
        self.head.right = self.tail
        self.tail.left = self.head
    }

    func get(_ key: Int) -> Int {
        // remove the [key: val] from list
        if let node = self.cache[key] {
            self.remove(node)

            // insert it to the tail of the list
            self.insert(node)

            return node.val
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        // remove the [key: val] pair from list
        if let node = self.cache[key] {
            self.remove(node)
        }

        // insert it to the tail of the list
        
        let newNode = Node(key, value)
        self.insert(newNode)
        self.cache[key] = newNode

        // if the list length > capacity
        // remove the item from the head of the list
        // remove it from the cache as well

        if self.cache.count > self.capacity {
            if let first = self.head.right {
                self.remove(first)
                self.cache.removeValue(forKey: first.key)
            }
        }
    }

    private func remove(_ node: Node) {
        let leftNode = node.left
        let rightNode = node.right
        leftNode?.right = rightNode
        rightNode?.left = leftNode
        

        // leftNode <-> node <-> rightNode
        // -> 
        // leftNode <-> rightNode
    }

    private func insert(_ node: Node) {
        let exLast = self.tail.left
        exLast?.right = node
        self.tail.left = node

        node.right = self.tail
        node.left = exLast

        // exLast <-> node <-> tail

    }
}
