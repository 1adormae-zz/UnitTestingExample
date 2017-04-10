//
//  ArtObject.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

class ArtPiece{
    
    var id : String
    var title : String
    var hasImage: Bool
    var imageURL: String?
    
    init(id:String, title:String, hasImage:Bool, imageURL : String = ""){
        self.id = id
        self.title = title
        self.hasImage = hasImage
    }

}



