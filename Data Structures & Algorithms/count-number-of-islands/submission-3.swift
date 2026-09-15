class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        let ROWS = grid.count
        let COLS = grid[0].count

        var grid = grid

        func dfs(_ row: Int, _ col: Int) {
            if row < 0 || row >= ROWS || col < 0 || col >= COLS || grid[row][col] == "0" {
                return
            }

            grid[row][col] = "0"
            dfs(row + 1, col)
            dfs(row - 1, col)
            dfs(row, col + 1)
            dfs(row, col - 1)
        }

        var res = 0
        for r in 0..<ROWS {
            for c in 0..<COLS {
                if grid[r][c] == "1" {
                    dfs(r, c)
                    res += 1
                }
            }
        }

        return res
    }
}
