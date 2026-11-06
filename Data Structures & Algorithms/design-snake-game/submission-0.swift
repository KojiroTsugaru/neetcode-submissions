class SnakeGame {
    
    private let width: Int
    private let height: Int
    private let food: [[Int]]
    private var foodIndex: Int
    private var snake: [(row: Int, col: Int)]
    private var snakeSet: Set<[Int]>
    
    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.width = width
        self.height = height
        self.food = food
        self.foodIndex = 0
        self.snake = [(0, 0)]
        self.snakeSet = [[0, 0]]
    }
    
    // start at [0, 0]
    func move(_ direction: String) -> Int {
        var curPos = snake.first!
        switch direction {
            case "R":
                curPos.col += 1
            case "L":
                curPos.col -= 1
            case "U":
                curPos.row -= 1
            case "D":
                curPos.row += 1
            default:
                break
        }

        if curPos.row < 0 || curPos.row >= self.height ||
            curPos.col < 0 || curPos.col >= self.width {
            return -1
        }

        let tail = snake.last!
        if foodIndex < food.count && curPos.row == food[foodIndex][0] && curPos.col == food[foodIndex][1] {
            foodIndex += 1
        } else {
            snake.removeLast()
            snakeSet.remove([tail.row, tail.col])
        }

        if snakeSet.contains([curPos.row, curPos.col]) {
            return -1
        }

        snake.insert(curPos, at: 0)
        snakeSet.insert([curPos.row, curPos.col])
        return snake.count - 1
    }
}