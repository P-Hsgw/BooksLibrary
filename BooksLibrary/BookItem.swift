//
//  BookItem.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import Foundation

struct BookItem: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let isRead: Bool
    
}
 
