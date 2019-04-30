//
//  AddItemController.swift
//  FinalProject
//
//  Created by Kyotani Tomoki on 4/30/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class AddItemController: UIViewController {
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var contactInfo: UITextField!
    @IBOutlet weak var detail: UITextField!
    @IBOutlet weak var requiredFieldWarning: UILabel!
    @IBOutlet var itemAddedPopOver: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requiredFieldWarning.isHidden = true
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        if itemTitle.text! != "" && ownerName.text! != "" && contactInfo.text! != ""{
            let item = Item(itemTitle: itemTitle.text!, ownerName: ownerName.text!, contactInfo: contactInfo.text!, detail: detail.text!)
            if (item.saveItem()) {
                // The object has been saved.
                self.requiredFieldWarning.isHidden = true
                self.itemTitle.text! = ""
                self.ownerName.text! = ""
                self.contactInfo.text! = ""
                self.detail.text! = ""
                self.view.addSubview(self.itemAddedPopOver)
                self.itemAddedPopOver.center = self.view.center
            } else {
                // There was a problem, check error.description
                print("saveItem returned false")
            }
        } else {
            self.requiredFieldWarning.isHidden = false
        }
    }
    
    @IBAction func closeItemAddedPopOver(_ sender: UIButton) {
        self.itemAddedPopOver.removeFromSuperview()
    }
}
