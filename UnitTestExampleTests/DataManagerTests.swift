//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by Adriana Ormaetxea on 07/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class DataManagerTests: XCTestCase {
    
    func testInitDataManager() {
        
        let dataManager = DataManager(d: DataProviderMock())
        XCTAssertNotNil(dataManager)
    }
    
    func testRetrieveCollection() {
        
        let dataManager = DataManager(d: DataProviderMock())
        var collection : [ArtPiece] = []
        dataManager.retrieveCollection { (result) in
            collection = result as! [ArtPiece]
        }
        XCTAssertNotNil(collection)
        XCTAssertEqual(collection.count ,1)
        
    }
    
}

