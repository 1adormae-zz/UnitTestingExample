//
//  ArtCollectionMapper.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation


func artCollectionMapper (collectionJson: [[String:Any]] ) -> [ArtPiece]
{
    var artCollection : [ArtPiece] = []
    for dictionary in collectionJson{
        if let piece = artPieceMapper(json: dictionary){
            artCollection.append(piece)
        }
    }
    return artCollection

}
