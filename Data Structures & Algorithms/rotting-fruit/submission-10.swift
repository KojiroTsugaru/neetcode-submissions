class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        // bfs
        // get the position of originally rotten fruits -> put them into a queue
        // start from there, run bfs until no fresh fruits remained

        var grid = grid
        let ROWS = grid.count
        let COLS = grid[0].count

        var q = [(Int, Int)]()
        var freshCount = 0

        for r in 0..<ROWS {
            for c in 0..<COLS {
                // rotten fruit found
                if grid[r][c] == 2 {
                    q.append((r, c))
                }
                if grid[r][c] == 1 {
                    freshCount += 1
                }
            }
        }

        var time = 0 
        while !q.isEmpty && freshCount > 0 {
            for _ in 0..<q.count {
                let (row, col) = q.removeFirst()

                // out of bounds or fruit is not fresh
                if (row < 0 || row >= ROWS || col < 0 || col >= COLS) ||
                    grid[row][col] == 0 {
                    continue
                }
                
                if grid[row][col] == 2 && time != 0 {
                    continue
                }
                
                if grid[row][col] == 1 {
                    grid[row][col] = 2
                    freshCount -= 1

                    if freshCount == 0 {
                        return time
                    }
                }

                q.append((row + 1, col))
                q.append((row - 1, col))
                q.append((row, col + 1))
                q.append((row, col - 1))
            }
            time += 1
        }

        return freshCount == 0 ? time : -1
    } 
}
