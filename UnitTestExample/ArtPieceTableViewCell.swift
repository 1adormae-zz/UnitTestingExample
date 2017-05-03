//
//  ArtPieceTableViewCell.swift
//  UnitTestExample
//
//  Created by cengiz.ata@philips.com on 02/05/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import UIKit

class ArtPieceTableViewCell : UITableViewCell {
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imagePiece : UIImageView!
    
    func configure(artPiece: ArtPiece) {
        self.title.text = artPiece.title
        
        if let imageURL = artPiece.imageURL {
            self.imagePiece.imageFromUrl(urlString: imageURL)
        }
        else {
            self.imagePiece?.image = UIImage.init(named: "Placeholder.png")
        }
    }
}
