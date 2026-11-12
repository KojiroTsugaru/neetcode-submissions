class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        grid = grid
        ROWS = len(grid)
        COLS = len(grid[0])

        directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        fresh = 0 # count fresh bananas
        q = deque() # store rotten oranges
        for r in range(ROWS):
            for c in range(COLS):
                if grid[r][c] == 1:
                    fresh += 1
                
                if grid[r][c] == 2:
                    q.append((r, c))

        # run bfs
        time = 0
        while fresh > 0 and q:
            for i in range(len(q)):
                # append onyl valid & fresh banana to queue
                row, col = q.popleft()
                
                for dr, dc in directions:
                    newR = row + dr
                    newC = col + dc

                    if newR in range(ROWS) and newC in range(COLS) and grid[newR][newC] == 1:
                        fresh -= 1
                        grid[newR][newC] = 2
                        q.append((newR, newC))

            time += 1

        # check no fresh bananas left after runnnig bfs from each rotten oranges
        if fresh > 0:
            return -1
        
        return time

        # no fresh bananas -> return time
        # else -> return -1