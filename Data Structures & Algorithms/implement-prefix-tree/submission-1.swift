class TreeNode {
    let val: Character?
    var children: [Character: TreeNode]
    var isEnd: Bool

    init(_ val: Character?) {
        self.val = val
        self.children = [Character: TreeNode]()
        self.isEnd = false
    }
}

class PrefixTree {

    let root: TreeNode
    
    init() {
        self.root = TreeNode(nil)
    }

    func insert(_ word: String) {
        var curr = root
        for char in word {
            if let next = curr.children[char] {
                curr = next
            } else {
                let newNode = TreeNode(char)
                curr.children[char] = newNode
                curr = newNode
            }
        }
        curr.isEnd = true
    }

    func search(_ word: String) -> Bool {
        var curr = root
        for char in word {
            guard let next = curr.children[char] else {
                return false
            }
            curr = next
        }
        return curr.isEnd
    }

    func startsWith(_ prefix: String) -> Bool {
        var curr = root
        for char in prefix {
            guard let next = curr.children[char] else {
                return false
            }
            curr = next
        }
        return true
    }
}
