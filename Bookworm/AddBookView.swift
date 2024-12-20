//
//  AddBookView.swift
//  Bookworm
//
//  Created by Philip Janzel Paradeza on 2024-11-03.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
            }
            Section("Write A review"){
                TextEditor(text: $review)
                RatingView(rating: $rating)
            }
            Section{
                Button("Save"){
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    modelContext.insert(newBook)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Book")
    }
}

#Preview {
    AddBookView()
}
