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
    @IBOutlet weak var owner: UILabel!
}

class SearchItemController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let cellIdentifier = "CellIdentifier"
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        // Fetch Fruit
        let item = items[indexPath.row]
        
        // Configure Cell
        cell.itemTitle?.text = item
        cell.owner?.text = "Tomoki Kyotani"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        print(item)
    }
}
