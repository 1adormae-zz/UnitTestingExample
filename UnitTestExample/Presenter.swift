//
//  Presenter.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

protocol PresenterInterface {
    func updateView()
    weak var view: ViewInterface? {set get}
}

class Presenter: PresenterInterface {
    weak var view: ViewInterface?
    var artCollection : [ArtPiece]?
    var dataManager = DataManager()
    
    func getArtCollection() {
        
        dataManager.retrieveCollection(completionHandler: { result in
            guard let collectionArray = result as? [ArtPiece]
            else {
                self.view?.dataIsReady(collection: nil)
                return
            }
            
            self.view?.dataIsReady(collection: collectionArray)
        })
    }
    
    func updateView() {
        // bussiness logic: getting data from netwrok call
        getArtCollection()
    }
}


