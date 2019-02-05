//
//  ViewController.swift
//  HW1_Flashlight
//
//  Created by Kyotani Tomoki on 1/31/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.backgroundColor == #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)  {
           sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            instructionLabel.text = "Touch screen to turn on"
            instructionLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            instructionLabel.text = "Touch screen to turn off"
            instructionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

