//
//  ContentView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var books = Books()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books.item, id:\.id ) { book in
                    Text(book.title)
                }.onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    let book = BookItem(title: "Book", author: "Author", isRead: true)
                    books.item.append(book)
                } label: {
                    Image(systemName: "plus")
                }
            }

        }
    }
    func removeItems (at offsets: IndexSet) {
        books.item.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
