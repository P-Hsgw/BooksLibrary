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
                ForEach(books.item) { book in
                    Text(book.title)
                }.onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("My Books")
        }
        

        .sheet(isPresented: $showingAddView) {
            AddView(books: books)
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
