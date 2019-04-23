//
//  TicTacToeController.swift
//  TicTacToe
//
//  Created by David Reed on 4/5/19.
//  Copyright © 2019 David Reed. All rights reserved.
//

import UIKit

class TicTacToeController: UIViewController {
    
    var game = TicTacToeGame()
    
    @IBOutlet var boardSpots: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var againButton: UIButton!
    
    @IBAction func boardClicked(_ sender: UIButton) {
        if let index = boardSpots.index(of: sender) {
            if game.place(piece: "X", inRow: index/3, andColumn: index%3) {
                if game.status() == "Play on..." {
                    game.place(piece: "O")
                }
                updateView()
            }
        }
    }

    
    @IBAction func playAgain(_ sender: UIButton) {
        resultLabel.isHidden = true
        againButton.isHidden = true
        game = TicTacToeGame()
        updateView()
    }
    
    func updateView() {
        for i in 0..<boardSpots.count {
            boardSpots[i].setTitle(game.board[i/3][i%3], for: .normal)
        }
        
        let result = game.status()
        if result != "Play on..." {
            resultLabel.text = result
            resultLabel.isHidden = false
            againButton.isHidden = false
        }
    }
}

