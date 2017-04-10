//
//  Presenter.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

protocol ViewProtocol : class{
    func dataIsReady(collection: [ArtPiece]?)
}

class Presenter {
    weak var view: ViewProtocol?
    var artCollection : [ArtPiece]?
    var dataManager : DataManager = DataManager()
    
    func getArtCollection() {
        dataManager.retrieveCollection(completionHandler: { (result) in
                        self.view?.dataIsReady(collection: result as! [ArtPiece]?)
                    })
    }
    
}
