
import Foundation
import Parse

struct DBconnection {
    private(set) var className: String
    
    func saveItem(item: Item) -> Bool{
        let itemTable = PFObject(className: self.className)
//Maybe can save an Item class instance instead of each String?
        itemTable["title"] = item.itemTitle
        itemTable["owner"] = item.ownerName
        itemTable["contactInfo"] = item.contactInfo
        itemTable["detail"] = item.detail
        
        var result = false
        
        do {
            try itemTable.save()
            result = true
        } catch let error{
            print("Failed to save data: \(error)")
        }
        
        return result
    }
}

struct Item {
    private(set) var itemTitle: String
    private(set) var ownerName: String
    private(set) var contactInfo: String
    private(set) var detail: String
}
