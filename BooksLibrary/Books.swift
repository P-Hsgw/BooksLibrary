//
//  Books.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import Foundation

class Books: ObservableObject {
    @Published var items = [BookItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
}
