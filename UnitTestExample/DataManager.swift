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
    func getCollection() -> Dictionary<String, Any>
}

class DataManager {
    
    func retrieveCollection() -> Dictionary<String, Any>{
        DataProvider provider =
    }

}
