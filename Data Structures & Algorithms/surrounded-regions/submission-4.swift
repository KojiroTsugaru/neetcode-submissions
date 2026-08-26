class Solution {
    func solve(_ board: inout [[Character]]) {
        let ROWS = board.count
        let COLS = board[0].count

        func dfs(_ row: Int, _ col: Int) {
            if row < 0 || row > ROWS - 1 || col < 0 || col > COLS - 1 || board[row][col] != "O" {
                return
            }

            board[row][col] = "T"
            dfs(row + 1, col)
            dfs(row - 1, col)
            dfs(row, col + 1)
            dfs(row, col - 1)
        }

        for r in 0..<ROWS {
            if board[r][0] == "O" {
                dfs(r, 0)
            }

            if board[r][COLS - 1] == "O" {
                dfs(r, COLS - 1)
            }
        }

        for c in 0..<COLS {
            if board[0][c] == "O" {
                dfs(0, c)
            }

            if board[ROWS - 1][c] == "O" {
                dfs(ROWS - 1, c)
            }
        }

        // flip T -> O
        // other cell -> X
        for r in 0..<ROWS {
            for c in 0..<COLS {
                if board[r][c] == "T" {
                    board[r][c] = "O"
                } else {
                    board[r][c] = "X"
                }
            }
        }
    }
}
