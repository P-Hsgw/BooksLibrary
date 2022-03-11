//
//  AddView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var books: Books
    
    @State private var title = ""
    @State private var author = ""
    @State private var read = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Toggle("Did you read it?", isOn: $read)
            }
            .navigationTitle("Add new book")
            .toolbar{
                Button("Save") {
                    let item = BookItem(title: title, author: author, isRead: read)
                    books.item.append(item)
                }
            }
        }

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(books: Books())
    }
}
