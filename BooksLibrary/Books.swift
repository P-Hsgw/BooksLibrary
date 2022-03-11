//
//  Books.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import Foundation

class Books: ObservableObject {
    @Published var item = [BookItem]()
}
