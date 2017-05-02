//
//  Presenter.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

protocol PresenterInterface {
    weak var view: ViewControllerInterface? { set get }
    
    func getArtCollection()
}

class Presenter: PresenterInterface {
    
    weak var view: ViewControllerInterface?
    var dataManager = DataManager()
    
    func getArtCollection() {
        dataManager.retrieveCollection(completionHandler: { result in
            self.view?.updateView(collection: result as? [ArtPiece])
        })
    }
}


