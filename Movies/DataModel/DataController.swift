//
//  DataModelController.swift
//  Movies
//
//  Created by Vivek Sehrawat on 24/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // Responsible for preparing a model
    let container = NSPersistentContainer(name: "MovieDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
//    func save(context: NSManagedObjectContext) {
//        do {
//            try context.save()
//            print("Data saved successfully. WUHU!!!")
//        } catch {
//            // Handle errors in our database
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }

}
