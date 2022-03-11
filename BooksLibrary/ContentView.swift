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
                        Text(book.isRead ? "Read" : "Want to read")
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
