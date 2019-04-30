//
//  AddItemController.swift
//  FinalProject
//
//  Created by Kyotani Tomoki on 4/30/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit
import Parse

class AddItemController: UIViewController {
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var contactInfo: UITextField!
    @IBOutlet weak var requiredFieldWarning: UILabel!
    @IBOutlet var itemAddedPopOver: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requiredFieldWarning.isHidden = true
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        self.view.addSubview(self.itemAddedPopOver)
        self.itemAddedPopOver.center = self.view.center
        
        if itemTitle.text! != "" && ownerName.text! != "" && contactInfo.text! != ""{
            let itemTable = PFObject(className: "items")
            itemTable["title"] = self.itemTitle.text!
            itemTable["owner"] = self.ownerName.text!
            itemTable["contactInfo"] = self.contactInfo.text!
            itemTable.saveInBackground {(success: Bool, error: Error?) in
                if (success) {
                    // The object has been saved.
                    print("Saveing Succeeded")
                    self.requiredFieldWarning.isHidden = true
                    self.itemTitle.text! = ""
                    self.ownerName.text! = ""
                    self.contactInfo.text! = ""
                    
                    self.view.addSubview(self.itemAddedPopOver)
                    self.itemAddedPopOver.center = self.view.center
                } else {
                    // There was a problem, check error.description
                    print("Saving Error")
                }
            }
        } else {
            self.requiredFieldWarning.isHidden = false
        }
    }
    
    @IBAction func closeItemAddedPopOver(_ sender: UIButton) {
        self.itemAddedPopOver.removeFromSuperview()
    }
}
