import UIKit

struct TicTacToeGame {
    private(set) var board: [[String]] = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    private(set) var gameHistory = ["X": 0, "O": 0, "Draws": 0]//keep track of X's wins, O's wins, and draws
    private(set) var isOver = false
    
    mutating func place(piece p: String, inRow r: Int, andColumn c: Int) -> Bool {
        if(board[r][c] != " "){
            return false
        } else {
            board[r][c] = p
            return true
        }
    }
    
    mutating func place(piece p: String) -> Bool {
        if(!self.isBoardFull()){
            //immediate win
            for i in 0..<self.board.count {
                for x in 0..<self.board.count {
                    if(self.board[i][x] == " "){
                        self.board[i][x] = p
                        
                        if(self.status() == "\(p) wins!"){
                            return true
                        } else {
                            self.board[i][x] = " "
                        }
                    }
                }
            }
            
            //avoid immediate loss
            for i in 0..<self.board.count {
                for x in 0..<self.board.count {
                    if(self.board[i][x] == " "){
                        self.board[i][x] = "X"
                        
                        if(self.status() == "X wins!"){
                            self.board[i][x] = p
                            return true
                        } else {
                            self.board[i][x] = " "
                        }
                    }
                }
            }
            
            //place randomly
            while(true){
                let r = Int.random(in: 0 ... 2)
                let c = Int.random(in: 0 ... 2)
                
                if(board[r][c] == " "){
                    self.board[r][c] = p
                    return true
                }
            }
        } else {
            return false
        }
    }
    
    func isBoardFull() -> Bool {
        for row in self.board {
            if(row.contains(" ")){
                return false
            }
        }
        return true
    }
    
    func status() -> String{
        //check diagonally
        if (self.board[1][1] != " " && ((self.board[0][0] == self.board[1][1] && self.board[1][1] == self.board[2][2]) || (self.board[0][2] == self.board[1][1] && self.board[1][1] == self.board[2][0]))){
            return "\(self.board[1][1]) wins!"
        }
        
        for i in 0..<self.board.count {
            //check horizontally
            if (self.board[i][0] != " " && self.board[i][0] == self.board[i][1] && self.board[i][0] == self.board[i][2]) {
                return "\(self.board[i][0]) wins!"
            }
            
            //check vertically
            if(self.board[0][i] != " " && self.board[0][i] == self.board[1][i] && self.board[0][i] == self.board[2][i]){
                return "\(self.board[0][i]) wins!"
            }
        }
        
        if (self.isBoardFull()){
            return "It's a draw."
        }
        
        return "Play on..."
    }
    
    mutating func stopGame() {
        self.isOver = true
    }
    
    mutating func restartGame() {
        self.board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        isOver = false
    }
    
    mutating func updateGameRecord(status : String) {
        self.gameHistory[status]! = self.gameHistory[status]! + 1
    }
    
    mutating func resetGameHistory() {
        self.gameHistory["X"] = 0
        self.gameHistory["O"] = 0
        self.gameHistory["Draws"] = 0
    }
}

var game = TicTacToeGame()

game.place(piece: "X", inRow: 0, andColumn: 0)
game.place(piece: "X", inRow: 0, andColumn: 1)
game.place(piece: "X", inRow: 0, andColumn: 2)
game.place(piece: "o", inRow: 0, andColumn: 2)
game.place(piece: "o", inRow: 1, andColumn: 1)
game.place(piece: "o")
game.updateGameRecord(status: "X")
game.stopGame()
print(game)
game.isBoardFull()
print(game.status())
game.resetGameHistory()
print(game.gameHistory)
game.restartGame()
print(game)
