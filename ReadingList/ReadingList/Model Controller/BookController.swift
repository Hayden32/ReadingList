//
//  BookController.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/20/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

class BookController {
    
    // MARK: - Properties
    var books: [Book] = []
    
    private var persistantURL: URL? {
        let fileManager = FileManager.default
        
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        print("Documents: \(documents.path)")
        
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    var readBooks: [Book] {
        return books.filter({ $0.hasBeenRead == true })
    }
    
    var unreadBooks: [Book] {
        return books.filter({ $0.hasBeenRead == false })
    }
    
    // MARK: - Methods/CRUD
    func createBook(title: String, reasonToRead: String) {
        let book = Book(has: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistantStore()
    }
    
    func deleteBook(book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        books.remove(at: index)
        saveToPersistantStore()
    }
    
    func updateHasBeenRead(for book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        books[index].hasBeenRead = !books[index].hasBeenRead
        saveToPersistantStore()
    }
    
    func update(book: Book, title: String, reasonToRead: String) {
        guard let index = books.firstIndex(of: book) else { return }
        books[index].title = title
        books[index].reasonToRead = reasonToRead
        saveToPersistantStore()
    }
    
    // MARK: - Methods/saving and loading persistant
    
    func saveToPersistantStore() {
        guard let url = persistantURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(books)
            try data.write(to: url)
        } catch {
            print("Error saving to persistant store. \(error)")
        }
    }
    
    func loadFromPersistantStore() {
        // make sure file exists
        let fileManager = FileManager.default
        guard let url = persistantURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: data)
        } catch {
            print("Error loading data from disk: \(error)")
        }
    }
}
