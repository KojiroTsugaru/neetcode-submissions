class TicTacToe {
    
    var rows: [Int]
    var cols: [Int]
    var diagonal: Int
    var antiDiagonal: Int
    let n: Int

    init(_ n: Int) {
        self.n = n
        self.rows = [Int](repeating: 0, count: n)
        self.cols = [Int](repeating: 0, count: n)
        self.diagonal = 0
        self.antiDiagonal = 0
    }

    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        
        let playerN = player == 1 ? 1 : -1
        rows[row] += playerN
        cols[col] += playerN

        // diagonal
        if row == col {
            diagonal += playerN
        }

        // anti diagonal 
        if row + col == n - 1 {
            antiDiagonal += playerN
        }

        // check winner 
        if abs(rows[row]) == n ||
            abs(cols[col]) == n ||
            abs(diagonal) == n ||
            abs(antiDiagonal) == n {
                return player
            }
        
        // no winner
        return 0


    }
}
