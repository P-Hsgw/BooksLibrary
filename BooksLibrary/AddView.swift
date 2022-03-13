//
//  AddView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var books: Books
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var read = false
    @State private var alert = false;
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Toggle("Did you read it?", isOn: $read)
                    .tint(.orange)
            }
            .navigationTitle("Add new book")
            .toolbar{
                Button("Save") {
                    if title == "" || author == "" {
                        alert = true;
                    } else {
                        let item = BookItem(title: title, author: author, isRead: read)
                        books.items.append(item)
                        dismiss()
                    }
                }
            }
        }.alert("Please fill out Title and Author", isPresented: $alert) {
            Button("OK") { }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(books: Books())
    }
}
