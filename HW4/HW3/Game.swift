//
//  Game.swift
//  HW3
//
//  Created by Kyotani Tomoki on 3/7/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

struct Game {
    private var player1: Player
    private var player2: Player
    private(set) var winningPoints: Int
    private(set) var winByTwo: Bool
    private(set) var incrementValue: Int
    private(set) var gameStarted: Bool
    private(set) var gameOver: Bool
    private(set) var winner: String
    
    init(p1: Player, p2: Player, winningPoints: Int, winByTwo: Bool, incrementValue: Int, gameStarted: Bool, gameOver: Bool, winner: String){
        self.player1 = p1
        self.player2 = p2
        self.winningPoints = winningPoints
        self.winByTwo = winByTwo
        self.incrementValue = incrementValue
        self.gameStarted = gameStarted
        self.gameOver = gameOver
        self.winner = winner
    }
    
    func getPlayer1() -> Player {
        return self.player1
    }
    
    func getPlayer2() -> Player {
        return self.player2
    }
    
    mutating func changeGameStatus(){
        self.gameStarted = (self.gameStarted == false)
    }
    
    mutating func updatePlayer1Name(name: String){
        self.player1.setName(name: name)
    }
    
    mutating func updatePlayer2Name(name: String){
        self.player2.setName(name: name)
    }
    
    mutating func updatePlayer1Points(points: Int){
        self.player1.setPoints(points: points)
    }
    
    mutating func updatePlayer2Points(points: Int){
        self.player2.setPoints(points: points)
    }
    
    mutating func setWinningPoints(winningPoints: Int) {
        self.winningPoints = winningPoints
    }
    
    mutating func setwinByTwo(winByTwo: Bool) {
        self.winByTwo = winByTwo
    }
    
    mutating func setIncrementValue(incrementValue: Int) {
        self.incrementValue = incrementValue
    }
    
    mutating func setWinner(winner: String){
        self.winner = winner
    }
    
    mutating func isOver() -> Bool {
        if(self.winByTwo){
            if((self.player1.points >= self.winningPoints || self.player2.points >= self.winningPoints) && (self.player1.points-self.player2.points >= 2 || self.player2.points-self.player1.points >= 2)){
                self.gameOver = true
                return true
            } else {
                return false
            }
        } else {
            if(self.player1.points >= self.winningPoints || self.player2.points >= self.winningPoints){
                self.gameOver = true
                return true
            } else {
                return false
            }
        }
    }
    
    mutating func resetGame(){
        self.player1.clearPoints()
        self.player2.clearPoints()
        self.gameStarted = false
        self.gameOver = false
    }
}
