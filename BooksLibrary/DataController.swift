//
//  DataController.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/19.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BooksLibrary")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

}
