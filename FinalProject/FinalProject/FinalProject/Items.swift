
import Foundation
import Parse

struct Items {
    
}

struct Item {
    private(set) var itemTitle: String
    private(set) var ownerName: String
    private(set) var contactInfo: String
    private(set) var detail: String
    
    func saveItem() -> Bool{
        let itemTable = PFObject(className: "items")
        itemTable["title"] = self.itemTitle
        itemTable["owner"] = self.ownerName
        itemTable["contactInfo"] = self.contactInfo
        itemTable["detail"] = self.detail
        
        var result = false
        
        do {
            try print("1.", itemTable.save())
            result = true
        } catch let error{
            print("Failed to save data: \(error)")
        }
        
        
        """
        itemTable.saveInBackground {(success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                result = true
                
                print("1. saved in databse in Item struct")
                //return result
            } else {
                print("1. failed in Item struct")
                //return result
            }
        }
        """
    
        return result
    }
}
