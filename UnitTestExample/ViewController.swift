//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var artCollection : [ArtPiece] = []
    @IBOutlet weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = Presenter()
        presenter.getArtCollection()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtPieceTableViewCell", for: indexPath)
            
        if let cell = cell as? ArtPieceTableViewCell {
            cell.title.text = (artCollection[indexPath.row]).title
        }
        
        return cell
    }
}

class ArtPieceTableViewCell : UITableViewCell{
    @IBOutlet weak var title : UILabel!
    
}

