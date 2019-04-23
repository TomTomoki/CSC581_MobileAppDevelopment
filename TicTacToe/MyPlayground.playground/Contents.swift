import UIKit

var str = "Hello, playground"

var test = [[0, 1, 2], [3, 4, 6]]

print(test[0][2])

print(test)

struct TicTacToeGame {
    private(set) var board: [[String]] = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    
    mutating func place(piece p: String, row r: Int, column c: Int) -> Bool {
        if(board[r][c] != " "){
            return false
        } else {
            board[r][c] = p
            return true
        }
    }
    
    mutating func place(piece p: String) -> Bool {
        var going = true
        
        while(going){
            //place piece randomly
        }
    
        return false
    }
}

var game = TicTacToeGame()

game.place(piece: "X", row: 0, column: 2)
game.place(piece: "X", row: 0, column: 2)
game.place(piece: "Tom")

print(game)
