//
//  BookTableViewCell.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book: Book?
    
    // MARK: - IBoutlets
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var hasBeenReadButton: UIButton!
    
    // MARK: - Methods
    
    func updateViews() {
        guard let book = book else { return }
        bookLabel.text = book.title
        
        let image = book.hasBeenRead ? #imageLiteral(resourceName: "checked") : #imageLiteral(resourceName: "unchecked")
        
        hasBeenReadButton.setImage(image, for: .normal)
    }
    
    
    // MARK: - IBActions
    @IBAction func hasBeenReadButtonTapped(_ sender: Any) {
        
    }
}
