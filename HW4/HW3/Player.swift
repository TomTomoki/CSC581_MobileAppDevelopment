//
//  Player.swift
//  HW3
//
//  Created by Kyotani Tomoki on 3/7/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

struct Player {
    private(set) var name: String
    private(set) var points: Int
    
    init(name: String, points: Int){
        self.name = name
        self.points = points
    }
    
    mutating func setName(name: String){
        self.name = name
    }
    
    mutating func setPoints(points: Int){
        self.points = points
    }
    
    mutating func clearPoints(){
        self.points = 0
    }
}
