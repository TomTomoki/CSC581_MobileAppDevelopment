//
//  ViewController.swift
//  HW3
//
//  Created by Kyotani Tomoki on 3/7/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player1Point: UILabel!
    @IBOutlet weak var player2Point: UILabel!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var WinningPointsLbl: UILabel!
    @IBOutlet weak var WinByTwoLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet var popOver: UIView!
    @IBOutlet weak var namePO: UILabel!
    
    //var viewController2 = ViewController2()
    
    var game = Game(p1: Player(name: "Player 1", points: 0), p2: Player(name: "Player 2", points: 0), winningPoints: 5, winByTwo: false, incrementValue: 1, gameStarted: false, gameOver: false, winner: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Name.text = game.getPlayer1().name
        player2Name.text = game.getPlayer2().name
        player1Point.text = String(game.getPlayer1().points)
        player2Point.text = String(game.getPlayer2().points)
        stepper1.stepValue = Double(game.incrementValue)
        stepper2.stepValue = Double(game.incrementValue)
        stepper1.maximumValue = Double(game.winningPoints*1000)
        stepper2.maximumValue = Double(game.winningPoints*1000)
        stepper1.value = Double(game.getPlayer1().points)
        stepper2.value = Double(game.getPlayer2().points)
        WinningPointsLbl.text = "Game Length: \(game.winningPoints)"
        if(game.winByTwo){
            WinByTwoLbl.text = "Win By Two: Yes"
        } else {
            WinByTwoLbl.text = "Win By Two: No"
        }
    }
    
    @IBAction func updatePoint(_ sender: UIStepper) {
        if(!game.gameStarted){
            game.changeGameStatus()
            
            /* This hides both buttons for some reason...
            settingBtn.isHidden = true
            restartBtn.isHidden = false
            */
        }
        
        if(sender.tag == 1){
            player1Point.text = String(Int(sender.value))
            game.updatePlayer1Points(points: Int(sender.value))
            
            if(game.isOver()){
                stepper1.isEnabled = false
                stepper2.isEnabled = false
                settingBtn.isEnabled = false
                game.setWinner(winner: game.getPlayer1().name)
                
                showPopOver(player: 1)
            }
        } else if (sender.tag == 2){
            player2Point.text = String(Int(sender.value))
            game.updatePlayer2Points(points: Int(sender.value))
            
            if(game.isOver()){
                stepper1.isEnabled = false
                stepper2.isEnabled = false
                settingBtn.isEnabled = false
                game.setWinner(winner: game.getPlayer2().name)
                
                showPopOver(player: 2)
            }
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        self.popOver.removeFromSuperview()
        
        stepper1.isEnabled = true
        stepper2.isEnabled = true
        settingBtn.isEnabled = true
        stepper1.value = 0
        stepper2.value = 0
        player1Point.text = String(Int(stepper1.value))
        player2Point.text = String(Int(stepper2.value))
        
        /*
        settingBtn.isHidden = false
        */
        
        game.resetGame()
    }
    
    @IBAction func goSetting(_ sender: UIButton) {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    @IBAction func restartPopOver(_ sender: UIButton) {
        self.popOver.removeFromSuperview()
        
        stepper1.isEnabled = true
        stepper2.isEnabled = true
        settingBtn.isEnabled = true
        stepper1.value = 0
        stepper2.value = 0
        player1Point.text = String(Int(stepper1.value))
        player2Point.text = String(Int(stepper2.value))
        
        /*
         settingBtn.isHidden = false
        */
        
        game.resetGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewContoroller2 = segue.destination as! SettingController
        viewContoroller2.game = self.game
        
    }
    
    func showPopOver(player: Int){
        if(player == 1){
            namePO.text = game.getPlayer1().name
        } else {
            namePO.text = game.getPlayer2().name
        }
        self.view.addSubview(popOver)
        popOver.center = view.center
    }
}
