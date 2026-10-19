class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let ROWS = grid.count
        let COLS = grid[0].count

        
        func dfs(_ r: Int, _ c: Int) {
            if r < 0 || r >= ROWS || c < 0 || c >= COLS || grid[r][c] == "0" {
                return
            }

            grid[r][c] = "0"
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        }

        var count = 0
        for i in 0..<ROWS {
            for j in 0..<COLS {
                if grid[i][j] == "1" {
                    count += 1
                    dfs(i, j)
                }
            }
        }

        return count
        
    }
}
