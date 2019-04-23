//
//  ViewController.swift
//  ParseTest
//
//  Created by Kyotani Tomoki on 4/18/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var Input: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    @IBAction func SaveData(_ sender: UIButton) {
        let demoTable = PFObject(className: "demo")
        demoTable["demoInput"] = self.Input.text
        demoTable.saveInBackground {(success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                print("Saveing Succeeded")
            } else {
                // There was a problem, check error.description
                print("Saving Error")
            }
        }
        self.view.endEditing(true)
        Input.text = ""
    }
    
    @IBAction func RetrieveData(_ sender: UIButton) {
        let query = PFQuery(className: "demo")
        query.findObjectsInBackground {(data, error) in
            if error == nil {
                print("Retriving Succeeded")
                
                if let demoData = data {
                    self.Output.text = demoData[demoData.count - 1]["demoInput"] as? String
                }
            } else {
                print("Retriving Error")
            }
        }
    }
}

