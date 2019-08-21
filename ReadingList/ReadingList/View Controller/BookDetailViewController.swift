//
//  BookDetailViewController.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    // MARK: - IBoutlets
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}
