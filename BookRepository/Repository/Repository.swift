//
//  Repository.swift
//  BookRepository
//
//  Created by Aruna Randika on 2023-03-22.
//

import Foundation
import CoreData
import UIKit

class BookRepo: ObservableObject {
    @Published var savedBooks: [BookData] = []
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "BooksModel")
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Error in loading the DB: \(error)")
            }else{
                print("DB loaded successfully")
            }
        }
        loadBooks()
    }
    
    func loadBooks(){
        let request = NSFetchRequest<BookData>(entityName: "BookData")
        
        do{
            savedBooks = try container.viewContext.fetch(request)
            
        }catch let error{
            print("Error in fetching data: \(error)")
        }
    }
    
    func addNewBook(name: String, author: String, description: String, image: String){
        let newBook = BookData(context: container.viewContext)
        
        newBook.name = name
        newBook.author = author
        newBook.short_description = description
        newBook.image = image
        
        saveData()
        
    }
    
    
    func saveData() {
        do{
            try container.viewContext.save()
            loadBooks()
        }catch let error{
            print("Error while saving data: \(error)")
        }
        
        
    }
    
    func deleteBook(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let book = savedBooks[index]
        container.viewContext.delete(book)
        saveData()
        loadBooks()
    }
}
