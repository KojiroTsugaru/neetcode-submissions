import Collections

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let ROWS = grid.count
        let COLS = grid[0].count

        var q = Deque<(Int, Int)>()
        var freshCount = 0

        for r in 0..<ROWS {
            for c in 0..<COLS {
                if grid[r][c] == 2 {
                    q.append((r, c))
                } else if grid[r][c] == 1 {
                    freshCount += 1
                }
            }
        }

        if freshCount == 0 { return 0 }

        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var time = 0

        while !q.isEmpty && freshCount > 0 {
            let levelSize = q.count

            for _ in 0..<levelSize {
                let (row, col) = q.removeFirst()

                for (dr, dc) in directions {
                    let nr = row + dr
                    let nc = col + dc

                    if nr < 0 || nr >= ROWS ||
                       nc < 0 || nc >= COLS {
                        continue
                    }

                    if grid[nr][nc] != 1 {
                        continue
                    }

                    grid[nr][nc] = 2
                    freshCount -= 1
                    q.append((nr, nc))
                }
            }

            time += 1
        }

        return freshCount == 0 ? time : -1
    }
}