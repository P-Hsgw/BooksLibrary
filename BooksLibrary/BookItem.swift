//
//  BookItem.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import Foundation

struct BookItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let author: String
    var isRead: Bool
}
 
