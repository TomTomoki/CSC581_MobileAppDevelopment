//
//  GameHistory.swift
//  TicTacToe
//
//  Created by Kyotani Tomoki on 4/26/19.
//  Copyright © 2019 David Reed. All rights reserved.
//

import UIKit

class GameHistoryController: UIViewController {

    var game = TicTacToeGame()
    
    @IBOutlet weak var xWins: UILabel!
    @IBOutlet weak var oWins: UILabel!
    @IBOutlet weak var draws: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        xWins.text = String(game.gameHistory["X"]!)
        xWins.text = String(game.gameHistory["O"]!)
        xWins.text = String(game.gameHistory["Draws"]!)
    }
    
    @IBAction func resetGameHistory(_ sender: UIButton) {
        game.resetGameHistory()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameTicTacToe = segue.destination as! TicTacToeController
        gameTicTacToe.game = self.game
    }
}
