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
    }
    
    func dataIsReady(collection: [ArtPiece]?) {
        if let collectionResult = collection{
            artCollection = collectionResult
            table.reloadData()
        }
    }
 }

class ArtPieceTableViewCell : UITableViewCell{
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imagePiece : UIImageView!
    
}

