//
//  ViewController.swift
//  HW1_DecisionMaker
//
//  Created by Kyotani Tomoki on 2/5/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class ViewController:
UIViewController {
    @IBOutlet weak var answer: UILabel!
    
    
    @IBAction func onClicked(_ sender: UIButton) {
        let randomValue = Int.random(in: 1...3)
        if randomValue == 1 {
            answer.text = "YES"
        } else if randomValue == 2 {
            answer.text = "NO"
        } else {
            answer.text = "MAYBE"
        }
    }
}
