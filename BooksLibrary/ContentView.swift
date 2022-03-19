//
//  ContentView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title ?? "No title")
                                .font(.headline)
                            Text("By: \(book.author ?? "No author")" )
                        }
                        Spacer()
                        Button {
                            toggleReadStatus(book: book)
                        } label: {
                            Image(systemName: (book.read ? "book.fill" : "book"))
                                .foregroundColor(book.read ? .orange : .gray)
                        }
                        
                    }
                }
                .onDelete(perform: deleteBooks)

            }
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView()
            }
            .navigationTitle("My books")
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // Find this book in fetch request
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
    
    func toggleReadStatus(book: Book) {
        book.read.toggle()
        try? moc.save()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
