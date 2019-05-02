//
//  AddItemController.swift
//  FinalProject
//
//  Created by Kyotani Tomoki on 4/30/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit

class AddItemController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var contactInfo: UITextField!
    @IBOutlet weak var detail: UITextField!
    @IBOutlet weak var requiredFieldWarning: UILabel!
    @IBOutlet var itemAddedPopOver: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dbConnection = DBconnection(className: "items")
    let categories = ["Clothes", "Furnitures", "Books", "Others"]
    var selectedCategoryIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requiredFieldWarning.isHidden = true
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        if itemTitle.text! != "" && ownerName.text! != "" && contactInfo.text! != ""{
            let item = Item(itemTitle: itemTitle.text!, ownerName: ownerName.text!, contactInfo: contactInfo.text!, category: self.categories[self.selectedCategoryIndex], detail: detail.text!)
            if (dbConnection.saveItem(item: item)) {
                // The object has been saved.
                self.requiredFieldWarning.isHidden = true
                self.itemTitle.text! = ""
                self.ownerName.text! = ""
                self.contactInfo.text! = ""
//set pickerview to the first item
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCategoryIndex = row
    }
}
