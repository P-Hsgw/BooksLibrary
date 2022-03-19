//
//  AddView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
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
                        let item = Book(context: moc)
                        item.id = UUID()
                        item.title = title
                        item.author = author
                        item.read = read
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
        }.alert("Please fill out Title and Author", isPresented: $alert) {
            Button("OK") { }
        }
    }
}
