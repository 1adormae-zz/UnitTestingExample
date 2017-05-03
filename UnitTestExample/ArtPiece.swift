//
//  ArtObject.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

class ArtPiece {
    
    private(set) var id : String
    private(set) var title : String
    private(set) var hasImage: Bool
    private(set) var imageURL: String?
    
    init(id: String, title: String, hasImage: Bool, imageURL: String?) {
        self.id = id
        self.title = title
        self.hasImage = hasImage
        self.imageURL = imageURL
    }
}



