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

class SearchItemController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate, UISearchBarDelegate {
   
    let cellIdentifier = "CellIdentifier"
    let dbConnection = DBconnection(className: "items")
    var items = Array<PFObject>()
    var searchedItems = Array<PFObject>()
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemTitlePO: UILabel!
    @IBOutlet weak var ownerNamePO: UILabel!
    @IBOutlet weak var contactInfoPO: UILabel!
    @IBOutlet weak var detailPO: UILabel!
    @IBOutlet var detailPopOver: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        
        self.items = dbConnection.fetchData()
        if (self.items.count > 0) {
            print("Items is not empty")
            self.tableView.reloadData()
        } else {
            print("Items is empty")
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
        if searching {
            return self.searchedItems.count
        } else {
            return self.items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CellIdentifier") as! ItemTableViewCell
        
        // Configure Cell
        if searching {
            cell.itemTitle?.text = self.searchedItems[indexPath.row]["title"] as? String
            cell.ownerName?.text = self.searchedItems[indexPath.row]["owner"] as? String
        } else {
            cell.itemTitle?.text = self.items[indexPath.row]["title"] as? String
            cell.ownerName?.text = self.items[indexPath.row]["owner"] as? String
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            let searchedItem = self.searchedItems[indexPath.row]
            self.itemTitlePO.text = (searchedItem["title"]! as! String)
            self.ownerNamePO.text = (searchedItem["owner"]! as! String)
            self.contactInfoPO.text = (searchedItem["contactInfo"]! as! String)
            if let d = searchedItem["detail"] {
                self.detailPO.text = (d as! String)
            }
        } else {
            let item = self.items[indexPath.row]
            self.itemTitlePO.text = (item["title"]! as! String)
            self.ownerNamePO.text = (item["owner"]! as! String)
            self.contactInfoPO.text = (item["contactInfo"]! as! String)
            if let d = item["detail"] {
                self.detailPO.text = (d as! String)
            }
        }
        
        //self.detailPO.sizeToFit()
        
        self.view.addSubview(self.detailPopOver)
        self.detailPopOver.center = self.view.center
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchedItems = self.items.filter({($0["title"] as? String)!.lowercased().contains(searchText.lowercased())})
        self.searching = true
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searching = false
        self.searchBar.text = ""
        self.tableView.reloadData()
    }
    
    @IBAction func selectCategoryFilter(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        
    }
}
