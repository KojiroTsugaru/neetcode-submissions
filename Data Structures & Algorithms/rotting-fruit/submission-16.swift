class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var fresh = 0
        let ROWS = grid.count
        let COLS = grid[0].count

        var q = [(Int, Int)]()

        for r in 0..<ROWS {
            for c in 0..<COLS {
                if grid[r][c] == 1 {
                    fresh += 1
                }

                if grid[r][c] == 2 {
                    q.append((r, c))
                }
            }
        }

        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        var time = 0
        while !q.isEmpty && fresh > 0 {
            time += 1
            for _ in 0..<q.count {
                let (row, col) = q.removeFirst()


                for (dr, dc) in directions {
                    let nextRow = row + dr
                    let nextCol = col + dc
                    if 0 <= nextRow && nextRow < ROWS && 
                        0 <= nextCol && nextCol < COLS &&
                        grid[nextRow][nextCol] == 1 {
                            grid[nextRow][nextCol] = 2
                            fresh -= 1
                            q.append((nextRow, nextCol))
                    }
                }
                
            }
        }

        if fresh > 0 {
            return -1
        }
        return time
    }
}
