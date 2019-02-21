//
//  ViewController.swift
//  HW2_Calculator
//
//  Created by Kyotani Tomoki on 2/19/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var output: UILabel!
    var model = CalculatorModel()
    var afterOperationClick = false
    
    @IBAction func Numbers(_ sender: UIButton) {
        if(afterOperationClick) {
            output.text! = "0"
        }
        
        if(sender.titleLabel!.text! != ".") {
            if(output.text! == "0"){
                output.text! = String(sender.titleLabel!.text!)
            } else {
                if(output.text!.contains(".") && output.text!.last! != "."){
                    output.text! = output.text!.dropLast() + sender.titleLabel!.text!
                } else {
                    output.text! = output.text! + String(sender.titleLabel!.text!)
                }
            }
        } else {
            if(!output.text!.contains(".")){
                output.text! = output.text! + "."
            }
        }
        afterOperationClick = false
    }
    
    @IBAction func Operations(_ sender: UIButton) {
        if(!afterOperationClick){ //need this boolean to handle operator changes
            model.apply(op: sender.titleLabel!.text!, with: Double(output.text!)!)
            output.text! = checkDecimalPoint(num: model.currentValue)
        } else { //when an operator clicked after "=" clicked & when an operator changed
            if(model.lastOp == "=") { //need to make lastOp visible because we need to see it when changing an operator
                model.apply(op: sender.titleLabel!.text!, with: Double(output.text!)!)
            } else if(model.lastOp == "+" || model.lastOp == "-"){
                model.apply(op: sender.titleLabel!.text!, with: 0.0)
            } else if(model.lastOp == "x" || model.lastOp == "÷"){
                model.apply(op: sender.titleLabel!.text!, with: 1.0)
            } else {
                print("error when handling operator changes")
            }
        }
        afterOperationClick = true
    }
    
    
    @IBAction func otherOperators(_ sender: UIButton) {
        if(sender.tag == 11){
            model.clear()
            output.text! = "0"
        } else if (sender.tag == 12){
            output.text! = checkDecimalPoint(num: Double(output.text!)! * -1)
        } else if (sender.tag == 13){
            output.text! = checkDecimalPoint(num: Double(output.text!)! * 0.01)
        } else {
            print("error with other operators")
        }
    }
    
    func checkDecimalPoint(num: Double) -> String {
        if(num.truncatingRemainder(dividingBy: 1) == 0){
            return String(Int(num))
        } else {
            return String(Double(round(10*num)/10))
        }
    }
}
