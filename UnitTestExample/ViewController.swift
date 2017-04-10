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
        }
    }
    
}

class artPieceTableViewCell : UITableViewCell{
    @IBOutlet weak var title : UILabel!
    
}

