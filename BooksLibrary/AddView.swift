//
//  AddView.swift
//  BooksLibrary
//
//  Created by Patryk Hasegawa on 2022/03/11.
//

import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var author = ""
    @State private var read = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
