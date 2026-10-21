class ListNode {
    var val: Int
    var key: Int
    var next: ListNode?
    var prev: ListNode?

    init(_ val: Int, _ key: Int) {
        self.val = val
        self.key = key
    }
}

class LRUCache {

    private let cap: Int
    var head: ListNode
    var tail: ListNode
    var cache: [Int: ListNode] // [key: listnode]

    init(_ capacity: Int) {
        self.cap = capacity

        self.head = ListNode(-1, -1)
        self.tail = ListNode(-1, -1)

        self.head.next = self.tail
        self.tail.prev = self.head

        self.cache = [Int: ListNode]()
    }

    /*
    // head <-> tail

    // insert node1:
    // head <-> node1 <-> tail

    // insert node2:
    // head <-> node1 <-> node2 <-> tail
    */


    // helpers
    func remove(_ key: Int, _ node: ListNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    func addLast(_ node: ListNode) {
        let prevNode = self.tail.prev
        prevNode?.next = node
        node.prev = prevNode
        node.next = self.tail
        self.tail.prev = node
    }

    func get(_ key: Int) -> Int {
        if let node = self.cache[key] {
            //  remove that node from the list
            remove(key, node)
            // add it as the last element -> helper 
            addLast(node)
            // return val
            return node.val
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        // first check if key exists in a cache
        if let node = self.cache[key] {
            remove(key, node)
        }
        
        let newNode = ListNode(value, key)
        addLast(newNode)
        self.cache[key] = newNode

        // check current capacity
        // if cache length is greater than the capacity
        if self.cache.count > self.cap {
            // remove the node at the very front  (head.next)
            if let nodeToRemove = self.head.next {
                remove(nodeToRemove.key, nodeToRemove)
                self.cache.removeValue(forKey: nodeToRemove.key)
            }
        }
    }
}