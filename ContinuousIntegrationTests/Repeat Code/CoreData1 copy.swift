//
//  CoreData1.swift
//  ContinuousIntegrationTests
//
//  Created by Ricardo Maqueda Martinez on 05/01/2021.
//

import Foundation
import CoreData

class CoreData5 {
    init() {
        let persistentContainer = NSPersistentContainer(name: "Model")
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        
        let group = DispatchGroup()
        
        group.enter()
        
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
            
            print("Core Data stack has been initialized with description: \(storeDescription)")
            
            group.leave()
        }
        
        group.wait()
        
        // 2. Create new item
        let context = persistentContainer.viewContext
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
        
        // 3. Save item
        try? context.save()
        
        // 4. Fetch items
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let fetchedItems = try? context.fetch(itemsFetchRequest)
        print("Fetched items: \(fetchedItems)")
        
        // 5. Delete item
        context.delete(item)
        
        let fetchedItemsAfterDelete = try? context.fetch(itemsFetchRequest)
        print("Fetched items: \(fetchedItemsAfterDelete)")
    }
    
}
