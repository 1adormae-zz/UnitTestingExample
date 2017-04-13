//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewProtocol {
    
    var artCollection : [ArtPiece] = []
    var dataSource : ColletionTableViewSource?
    
    @IBOutlet weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = Presenter()
        presenter.getArtCollection()
        presenter.view = self
        dataSource = ColletionTableViewSource(collection: artCollection)
        table.dataSource = dataSource
    }
    
    func dataIsReady(collection: [ArtPiece]?) {
        if let collectionResult = collection{
            artCollection = collectionResult
            dataSource?.reloadWithCollection(collection: artCollection)
            table.reloadData()
        }
    }
 }


class ArtPieceTableViewCell : UITableViewCell{
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imagePiece : UIImageView!
    
    func configure(artPiece: ArtPiece){
        self.title.text = artPiece.title
        if let imageURL = artPiece.imageURL {
            self.imagePiece.imageFromUrl(urlString: imageURL)
        }
        else{
            self.imagePiece?.image = UIImage.init(named: "Placeholder.png")
        }
        
    }
    
}

