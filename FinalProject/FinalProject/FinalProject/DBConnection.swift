
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
    
    func fetchData() -> Array<PFObject>{
        let query = PFQuery(className: self.className)
        var fetchedItems = Array<PFObject>()
        
        do {
            try fetchedItems = query.findObjects()
            print("Retriving Succeeded")
        } catch let error{
            print("Failed to retrieve data: \(error)")
        }

        return fetchedItems
    }
}
