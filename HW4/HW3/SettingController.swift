//
//  ViewController2.swift
//  HW3
//
//  Created by Kyotani Tomoki on 3/8/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    @IBOutlet weak var winningPoints: UITextField!
    @IBOutlet weak var incrementValue: UITextField!
    @IBOutlet weak var winByTwo: UISwitch!
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    @IBOutlet weak var warning1: UILabel!
    @IBOutlet weak var warning2: UILabel!
    @IBOutlet weak var warningNumeric: UILabel!
    
    //var viewController1 = ViewController()
    
    var game = Game(p1: Player(name: "Player 1", points: 0), p2: Player(name: "Player 2", points: 0), winningPoints: 5, winByTwo: false, incrementValue: 1, gameStarted: false, gameOver: false, winner: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winningPoints.text = String(self.game.winningPoints)
        incrementValue.text = String(self.game.incrementValue)
        winByTwo.isOn = self.game.winByTwo
        player1Name.text = self.game.getPlayer1().name
        player2Name.text = self.game.getPlayer2().name
    }
    
    @IBAction func checkGameStatus(_ sender: UITextField) {
        if(game.gameStarted){
            sender.isEnabled = false
            warning1.isHidden = false
            warning2.isHidden = false
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if(sender.tag == 1){ //winningPoints
            if let points = Int(sender.text!) {
                game.setWinningPoints(winningPoints: points)
                warningNumeric.isHidden = true
            } else {
                sender.text = String(game.winningPoints)
                warningNumeric.isHidden = false
            }
        } else if(sender.tag == 2){ //incrementValue
            if let value = Int(sender.text!) {
                game.setIncrementValue(incrementValue: value)
                print(sender.allControlEvents)
                warningNumeric.isHidden = true
            } else {
                sender.text = String(game.incrementValue)
                warningNumeric.isHidden = false
            }
        } else if(sender.tag == 3){//player1Name
            if(sender.text! != ""){
                game.updatePlayer1Name(name: sender.text!)
            } else {
                sender.text = game.getPlayer1().name
            }
        } else if(sender.tag == 4){//player2Name
            if(sender.text! != ""){
                game.updatePlayer2Name(name: sender.text!)
            } else {
                sender.text = game.getPlayer2().name
            }
        }
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if(game.gameStarted){
            sender.isEnabled = false
            warning1.isHidden = false
            warning2.isHidden = false
        } else {
            game.setwinByTwo(winByTwo: sender.isOn)
        }
    }
    
    @IBAction func goGame(_ sender: UIButton) {
        warning1.isHidden = true
        warning2.isHidden = true
        warningNumeric.isHidden = true
        
        if(winningPoints.isEditing){
            if let points = Int(winningPoints.text!) {
                game.setWinningPoints(winningPoints: points)
                warningNumeric.isHidden = true
            }
        } else if(incrementValue.isEditing){
            if let value = Int(incrementValue.text!) {
                game.setIncrementValue(incrementValue: value)
                warningNumeric.isHidden = true
            }
        } else if(player1Name.isEditing){
            if(player1Name.text! != ""){
                game.updatePlayer1Name(name: player1Name.text!)
            }
        } else if(player2Name.isEditing){
            if(player2Name.text! != ""){
               game.updatePlayer2Name(name: player2Name.text!)
            }
        }
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameContoroller = segue.destination as! GameController
        gameContoroller.game = self.game
    }
}
