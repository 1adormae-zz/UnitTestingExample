//
//  Presenter.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

protocol ViewProtocol : class{
    func dataIsReady(collection: [String:Any]?)
}

class Presenter {
    weak var view: ViewProtocol?
    var artCollection : [String: Any]?
    
    func getArtCollection() {
        artCollection = DataManager().retrieveCollection()
        view?.dataIsReady(collection: artCollection)
    }
    
    
    
}
