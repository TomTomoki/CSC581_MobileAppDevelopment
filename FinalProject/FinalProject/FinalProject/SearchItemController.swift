//
//  ViewController.swift
//  FinalProject
//
//  Created by Kyotani Tomoki on 4/27/19.
//  Copyright © 2019 Kyotani Tomoki. All rights reserved.
//

import UIKit
import Parse

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var ownerName: UILabel!
}

class SearchItemController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let cellIdentifier = "CellIdentifier"
    var items = [PFObject(className: "items")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "items")
        query.findObjectsInBackground {(data, error) in
            if error == nil {
                print("Retriving Succeeded")
                
                if let itemData = data {
                    self.items = itemData
                    print(self.items)
                    
                    self.tableView.reloadData()
                }
            } else {
                print("Retriving Error")
            }
        }
        
        """
        let itemTable = PFObject(className: "items")
        itemTable["title"] = "AppleWatch"
        itemTable["contactInfo"] = "000-555-1111"
        itemTable["owner"] = "Ayaka Kyotani"
        itemTable.saveInBackground {(success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                print("Saveing Succeeded")
            } else {
                // There was a problem, check error.description
                print("Saving Error")
            }
        }
        """
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! ItemTableViewCell
        let cell:ItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as! ItemTableViewCell
        
        // Configure Cell
        cell.itemTitle?.text = self.items[indexPath.row]["title"] as? String
        //cell.itemTitle?.text = ""
        cell.ownerName?.text = self.items[indexPath.row]["owner"] as? String
        //cell.ownerName?.text = "test2"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let item = items[indexPath.row]
        //print(item)
    }
}
