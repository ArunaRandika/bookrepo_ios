//
//  Book.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-21.
//

import Foundation

struct Book {
    var id = UUID()
    var name: String
    var image: String
    var author: String
}

struct DummyBooks {
    var books: [Book] = [Book(name: "Psychology of Money", image: "book_1", author: "Morgan Housel "),Book(name: "Subtle Art of not Giving a Fuck", image: "book_2", author: "Mark Manson "),Book(name: "Everything is Fucked", image: "book_3", author: "Mark Manson")]
}
