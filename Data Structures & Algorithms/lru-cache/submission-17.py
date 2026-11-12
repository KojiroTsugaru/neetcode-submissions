class ListNode:
    def __init__(self, key: int, val: int):
        self.key = key
        self.val = val
        self.next = None
        self.prev = None

class LRUCache:

    def __init__(self, capacity: int):
        self.cap = capacity
        self.cache = {}
        self.head = ListNode(-1, -1)
        self.tail = ListNode(-1, -1)

        self.head.next = self.tail
        self.tail.prev = self.head

    def remove(sefl, node: ListNode):
        node.prev.next = node.next
        node.next.prev = node.prev


    def insert(self, node: ListNode):
        last = self.tail.prev
        last.next = node
        self.tail.prev = node

        node.prev = last
        node.next = self.tail

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        
        # remove
        node = self.cache[key]
        self.remove(node)

        # insert
        self.insert(node)

        # return val
        return node.val

    def put(self, key: int, value: int) -> None:
        # self.remove 
        if key in self.cache:
            self.remove(self.cache[key])

        # insert
        node = ListNode(key, value)
        self.cache[key] = node
        self.insert(node)

        # check capacity
        if len(self.cache) > self.cap:
            # self.remove LRU
            lru = self.head.next
            self.remove(lru)
            del self.cache[lru.key]
