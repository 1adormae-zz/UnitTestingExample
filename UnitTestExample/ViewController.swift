//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewProtocol, UITableViewDataSource {
    
    var artCollection : [ArtPiece] = []
    @IBOutlet weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = Presenter()
        presenter.getArtCollection()
        presenter.view = self
    }
    
    func dataIsReady(collection: [ArtPiece]?) {
        if let collectionResult = collection{
            artCollection = collectionResult
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artPieceCellIdentifier", for: indexPath)
            
        if let cell = cell as? ArtPieceTableViewCell {
            let artPiece = artCollection[indexPath.row]
            cell.title.text = artPiece.title
            if let imageURL = artPiece.imageURL {
                cell.imagePiece.imageFromUrl(urlString: imageURL)
            }
            else{
                cell.imagePiece?.image = UIImage.init(named: "Placeholder.png")
            }
        }
        return cell
    }
    
}

class ArtPieceTableViewCell : UITableViewCell{
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var imagePiece : UIImageView!
    
    
}

