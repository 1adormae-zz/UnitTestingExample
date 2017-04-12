//
//  ArtCollectionMapper.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

func artCollectionMapper (collectionJson: [[String:Any]] ) -> [ArtPiece] {
    
    var artCollection = [ArtPiece]()
    
    for dictionary in collectionJson{
        if let piece = artPieceMapper(json: dictionary){
            artCollection.append(piece)
        }
    }
    return artCollection
}

private func artPieceMapper(json: [String: Any])-> ArtPiece? {
    
    if let id = json["id"] as? String,
        let title = json["title"] as? String,
        let hasImage = json["hasImage"] as? Bool {
        
        var imageString: String?
        
        if let webJson = json["webImage"] as? [String: Any], let url = webJson["url"] as? String, hasImage {
            imageString = url
        }
        
        return ArtPiece(id: id, title: title, hasImage: hasImage, imageURL: imageString)
    }
    
    return nil
}
