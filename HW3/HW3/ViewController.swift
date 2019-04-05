//
//  ViewController.swift
//  HW3
//
//  Created by Kyotani Tomoki on 3/7/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player1Point: UILabel!
    @IBOutlet weak var player2Point: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    
    //var viewController2 = ViewController2()
    
    var game = Game(p1: Player(name: "Player 1", points: 0), p2: Player(name: "Player 2", points: 0), winningPoints: 5, winByTwo: false, incrementValue: 1, gameStarted: false, gameOver: false, winner: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view1 \(self.game)")
        
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
        
        if(game.gameOver){
            stepper1.isEnabled = false
            stepper2.isEnabled = false
            name.text = game.winner
            name.isHidden = false
            message.isHidden = false
        }
    }
    
    @IBAction func updatePoint(_ sender: UIStepper) {
        if(!game.gameStarted){
            game.changeGameStatus()
        }
        
        if(sender.tag == 1){
            player1Point.text = String(Int(sender.value))
            game.updatePlayer1Points(points: Int(sender.value))
            
            print(self.game.winningPoints)
            
            if(game.isOver()){
                name.text = game.getPlayer1().name
                message.isHidden = false
                name.isHidden = false
                message.isHidden = false
                stepper1.isEnabled = false
                stepper2.isEnabled = false
                game.setWinner(winner: game.getPlayer1().name)
            }
        } else if (sender.tag == 2){
            player2Point.text = String(Int(sender.value))
            game.updatePlayer2Points(points: Int(sender.value))
            
            if(game.isOver()){
                name.text = game.getPlayer2().name
                message.isHidden = false
                name.isHidden = false
                message.isHidden = false
                stepper1.isEnabled = false
                stepper2.isEnabled = false
                game.setWinner(winner: game.getPlayer2().name)
            }
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        stepper1.isEnabled = true
        stepper2.isEnabled = true
        stepper1.value = 0
        stepper2.value = 0
        player1Point.text = String(Int(stepper1.value))
        player2Point.text = String(Int(stepper2.value))
        name.isHidden = true
        message.isHidden = true

        game.resetGame()
    }
    
    @IBAction func goSetting(_ sender: UIButton) {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewContoroller2 = segue.destination as! ViewController2
        viewContoroller2.game = self.game
        
    }
}
