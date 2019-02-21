//
//  Calculator.swift
//  HW2_Calculator
//
//  Created by Kyotani Tomoki on 2/20/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import Foundation

struct CalculatorModel {
    private(set) var currentValue = 0.0
    private(set) var lastOp = "+" //need to make lastOp visible because we need to see it when changing an operator
    
    mutating func apply(op: String, with number: Double) {
        if self.lastOp == "=" {
            self.currentValue = number
        }
        else if self.lastOp == "+" {
            self.currentValue += number
        }
        else if self.lastOp == "-" {
            self.currentValue -= number
        }
        else if self.lastOp == "*" || self.lastOp == "x" {
            self.currentValue *= number
        }
        else if self.lastOp == "/" || self.lastOp == "÷" {
            self.currentValue /= number
        }
        self.lastOp = op
    }
    
    mutating func clear() {
        self.currentValue = 0.0;
        self.lastOp = "="
    }
}
