//
//  ContentView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject var books = Books()
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books.items) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text("By: " + book.author)
                        }
                        Spacer()
                        Button {
                            // Create new BookItem with changed isRead Bool
                            let replacedBook = BookItem(title: book.title, author: book.author, isRead: !book.isRead)
                            // Find current book index, and replace current book with new book
                            if let i = books.items.firstIndex(of: book) {
                                books.items[i] = replacedBook
                            }
                        } label: {
                            Image(systemName: (book.isRead ? "book.fill" : "book"))
                                .foregroundColor(book.isRead ? .orange : .gray)
                        }
                    }
                }.onDelete(perform: removeItems)
            }
            .toolbar {
                HStack{
                    Button {
                        showingAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("My Books")
        }
        .sheet(isPresented: $showingAddView) {
            AddView(books: books)
        }
    }
    func removeItems (at offsets: IndexSet) {
        books.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
