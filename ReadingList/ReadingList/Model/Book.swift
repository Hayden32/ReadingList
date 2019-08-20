//
//  Book.swift
//  ReadingList
//
//  Created by Hayden Hastings on 8/20/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    var title: String
    var reasonToRead: String
    var hasBeenRead: Bool
    
    init(has title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
}
