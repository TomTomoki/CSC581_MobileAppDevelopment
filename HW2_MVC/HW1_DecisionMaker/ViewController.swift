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
    
    var decider = Decider(between: ["YES", "NO", "MAYBE"])
    
    @IBAction func onClicked(_ sender: UIButton) {
        answer.text = decider.getAnswer()
    }
}
