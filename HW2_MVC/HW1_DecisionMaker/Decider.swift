//
//  Decider.swift
//  HW1_DecisionMaker
//
//  Created by Kyotani Tomoki on 2/19/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import Foundation

struct Decider {
    private let options: [String]
    
    init(between options: [String]) {
        self.options = options
    }
    
    func getAnswer() -> String {
        return self.options[Int.random(in: 0..<options.count)]
    }
}
