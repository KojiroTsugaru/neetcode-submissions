class SnakeGame {
    /*
    second piece of food will not appear until the snake eats the first piece of food.
    When a piece of food appears on the screen, it is guaranteed that it will not appear 
    on a block occupied by the snake.

    The game is over if the snake goes out of bounds (hits a wall) or if its head occupies 
    a space that its body occupies after moving
    */

    private let food: [[Int]]
    private var body: Set<Int> // occupied tiles
    private var head: [Int]
    private let width: Int
    private let height: Int
    private var snakeSet: Set<String>
    private var snake: [[Int]]
    private var foodIndex: Int

    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.head = [0, 0]
        self.body = Set<Int>()

        self.food = food
        self.width = width 
        self.height = height

        self.snakeSet = Set<String>(["0,0"])
        self.snake = [[0, 0]]
        self.foodIndex = 0
    }   

    func move(_ direction: String) -> Int {
        var newHead = head
        switch direction {
            case "R":
                newHead[1] += 1
            case "L":
                newHead[1] -= 1
            case "U":
                newHead[0] -= 1
            case "D":
                newHead[0] += 1
            default:
                break
        }
        
        // out of bounds
        if newHead[0] < 0 || newHead[0] >= height || 
            newHead[1] < 0 || newHead[1] >= width {
            return -1
        }
        
        // hit body
        let newHeadKey = "\(newHead[0]),\(newHead[1])"
        let tail = snake[snake.count - 1]
        let tailKey = "\(tail[0]),\(tail[1])"

        if snakeSet.contains(newHeadKey) && newHeadKey != tailKey {
            return -1
        }

        if foodIndex < food.count &&
            food[foodIndex] == newHead {
                foodIndex += 1
        } else {
            snakeSet.remove(tailKey)
            snake.removeLast()
        }

        snake.insert(newHead, at: 0)
        snakeSet.insert(newHeadKey)
        head = newHead

        return snake.count - 1
    }   
}