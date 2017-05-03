//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import UIKit

protocol ViewControllerInterface : class {
    func updateView(collection: [ArtPiece]?)
}

class ViewController: UIViewController {
    
    var artCollection = [ArtPiece]()
    var dataSource : ColletionTableViewSource?
    var eventHandler: PresenterInterface!
    
    @IBOutlet private(set) weak var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        eventHandler = Presenter()
        eventHandler.view = self
        eventHandler.getArtCollection()
        
        dataSource = ColletionTableViewSource()
        table.dataSource = dataSource
    }
 }

extension ViewController: ViewControllerInterface {
    
    func updateView(collection: [ArtPiece]?) {
        if let collectionResult = collection {
            artCollection = collectionResult
            dataSource?.showCollection(collection: artCollection)
            table.reloadData()
        }
    }
}

