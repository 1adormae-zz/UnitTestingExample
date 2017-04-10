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
    func getCollection() -> [String: Any]
}

class MyDataProvider : DataProvider{
    func getCollection() -> [String: Any] {
        //Backend call to get the data
        return [:]
    }
}

struct DataManager {
    private var dataProvider: DataProvider
    private var internalDataProvide: MyDataProvider?
    
    init(d: DataProvider = MyDataProvider()) {
        self.dataProvider = d
    }
    
    func retrieveCollection() -> [String: Any] {
        return self.dataProvider.getCollection()
    }
}

