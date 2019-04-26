import UIKit

struct TicTacToeGame {
    private(set) var board: [[String]] = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    //private(set) var board: [[String]] = [[" ", "x", "x"], ["x", "x", "x"], ["x", "x", "x"]]
    
    mutating func place(piece p: String, row r: Int, column c: Int) -> Bool {
        if(board[r][c] != " "){
            return false
        } else {
            board[r][c] = p
            return true
        }
    }
    
    mutating func place(piece p: String) -> Bool {
        while(!self.isBoardFull()){
            let r = Int.random(in: 0 ... 2)
            let c = Int.random(in: 0 ... 2)
            
            if(board[r][c] == " "){
                board[r][c] = p
                
                //if it leads to win, if not avoid loss
                if (self.status()){
                    
                    
                }
                
                return true
            }
        }
    
        return false
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
}

var game = TicTacToeGame()

game.place(piece: "X", row: 0, column: 2)
game.place(piece: "X", row: 0, column: 2)
game.place(piece: "Tom")
print(game)
game.isBoardFull()
