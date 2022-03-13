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
                ForEach($books.items) { $book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text("By: " + book.author)
                        }
                        Spacer()
                        Button(book.isRead ? "Read" : "Want to read") {
                            let replacedBook = BookItem(title: book.title, author: book.author, isRead: !book.isRead)
                            if let i = books.items.firstIndex(of: book) {
                                books.items[i] = replacedBook
                            }
//                            if var currentBook = books.items.first(where: {$0.id == book.id}) {
//                                currentBook = replacedBook
//                                print("This is currentBook \(currentBook)")
//                                print("This is real book from library \(books.items)")
//                            }
                        }
                        .foregroundColor(.orange)
                    }
                }.onDelete(perform: removeItems)
            }
            .toolbar {
                HStack{
                    Button {
                        showingAddView = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                    }
                    EditButton()
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
