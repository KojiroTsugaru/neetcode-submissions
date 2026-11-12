class SnakeGame:

    def __init__(self, width: int, height: int, food: List[List[int]]):
        self.snake = deque()
        self.snake.append([0,0])
        self.width = width
        self.height = height
        self.food = food
        self.foodIndex = 0


    def move(self, direction: str) -> int:

        # get new head
        head = list(self.snake[-1])
        if direction == "R":
            head[1] += 1
        elif direction == "L":
            head[1] -= 1
        elif direction == "U":
            head[0] -= 1
        elif direction == "D":
            head[0] += 1

        # check if:
        # 1. snake is out of bounds
        if head[0] < 0 or head[0] >= self.height or head[1] < 0 or head[1] >= self.width:
            return -1
        
        # 2. bite itself

        # edge case:
        # if new head is at current tail, then it's valid move 
        if self.foodIndex < len(self.food) and head == self.food[self.foodIndex]:
            self.foodIndex += 1
        else:
            self.snake.popleft()
        
        if head in self.snake:
            return -1

        # if there is a food at new snake head,
        # do not remove the tail
        # else:
        # remove the tail
        self.snake.append(head)

        return len(self.snake) - 1


# Your SnakeGame object will be instantiated and called as such:
# obj = SnakeGame(width, height, food)
# param_1 = obj.move(direction)