//
//  ReadingListTableViewController.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController, BookTableViewCellDelegate {
    
    // MARK: - Properties
    var bookController = BookController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Methods
    
    private func bookFor(indexPath: IndexPath) -> Book {
        if indexPath.section == 0 {
            return bookController.readBooks[indexPath.row]
        } else {
            return bookController.unreadBooks[indexPath.row]
        }
    }
    
    func toggleHasBeenRead(for cell: BookTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let book = bookFor(indexPath: indexPath)
        
        bookController.updateHasBeenRead(for: book)
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return bookController.readBooks.count
        } else {
            return bookController.unreadBooks.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        
        let book = bookFor(indexPath: indexPath)
        
        cell.book = book
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            guard bookController.readBooks.count > 0 else { return nil }
            return "Read Books"
        } else {
            guard bookController.unreadBooks.count > 0 else { return nil }
            return "Unread Books"
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let book = bookFor(indexPath: indexPath)
            
            bookController.deleteBook(book: book)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addBookDetail" {
            guard let destinationVC = segue.destination as? BookDetailViewController else { return }
            
            destinationVC.bookController = bookController
        } else if segue.identifier == "toBookDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? BookDetailViewController else { return }
            
            let book = bookFor(indexPath: indexPath)
            
            destinationVC.book = book
            destinationVC.bookController = bookController
        }
    }
}
