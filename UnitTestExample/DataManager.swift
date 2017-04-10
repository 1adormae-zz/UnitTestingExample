//
//  DataManager.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//
//   This Class is resposable to retrieve or save the data
//
import Foundation

protocol DataProvider{
     func getCollection(completionHandler:@escaping CallBack)
}


struct DataManager {
    private var dataProvider: DataProvider
    
    init(d: DataProvider = NetworkDataProvider()) {
        self.dataProvider = d
    }
    
    func retrieveCollection(completionHandler:@escaping CallBack) {
        self.dataProvider.getCollection { (response) in
            completionHandler(response)
        }
    }
}

