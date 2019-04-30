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

class SearchItemController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate {
   
    let cellIdentifier = "CellIdentifier"
    var items = [PFObject(className: "items")]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemTitlePO: UILabel!
    @IBOutlet weak var ownerNamePO: UILabel!
    @IBOutlet weak var contactInfoPO: UILabel!
    @IBOutlet var detailPopOver: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        
        let query = PFQuery(className: "items")
        query.findObjectsInBackground {(data, error) in
            if error == nil {
                print("Retriving Succeeded")
                
                if let itemData = data {
                    self.items = itemData
                    self.tableView.reloadData()
                }
            } else {
                print("Retriving Error")
            }
        }
    }
    
    @IBAction func closePO(_ sender: UIButton) {
        self.detailPopOver.removeFromSuperview()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.tabBarController?.selectedIndex == 0{
            self.viewDidLoad()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as! ItemTableViewCell
        
        // Configure Cell
        cell.itemTitle?.text = self.items[indexPath.row]["title"] as? String
        cell.ownerName?.text = self.items[indexPath.row]["owner"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        self.itemTitlePO.text = (item["title"]! as! String)
        self.ownerNamePO.text = (item["owner"]! as! String)
        self.contactInfoPO.text = (item["contactInfo"]! as! String)
        
        self.view.addSubview(self.detailPopOver)
        self.detailPopOver.center = self.view.center
    }
}
