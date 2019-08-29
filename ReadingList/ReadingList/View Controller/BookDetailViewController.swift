//
//  BookDetailViewController.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?
    
    // MARK: - IBoutlets
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Methods
    private func updateViews() {
        guard let book = book else {
            title = "Add a new book"
            return }
        
        title = book.title
        bookTextField.text = book.title
        reasonToReadTextView.text = book.reasonToRead
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let bookTitle = bookTextField.text,
            let reasonToRead = reasonToReadTextView.text,
            bookTitle != "" && reasonToRead != "" else { return }
        
        if let book = book {
            bookController?.update(book: book, title: bookTitle, reasonToRead: reasonToRead)
        } else {
            bookController?.createBook(title: bookTitle, reasonToRead: reasonToRead)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
