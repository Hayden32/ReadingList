//
//  BookTableViewCellDelegate.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: class {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
