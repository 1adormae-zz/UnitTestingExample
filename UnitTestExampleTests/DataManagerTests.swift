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
        
        let dataManager = DataManager(d: MockDataProvider())
        XCTAssertNotNil(dataManager)
    }
    
    func testRetrieveCollection() {
        
        let dataManager = DataManager(d: MockDataProvider())
        var collection : [ArtPiece] = []
        dataManager.retrieveCollection { (result) in
            collection = result as! [ArtPiece]
        }
        XCTAssertNotNil(collection)
        XCTAssertEqual(collection.count ,1)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}


class MockDataProvider : DataProviderProtocol
{
    func getCollection(completionHandler: @escaping CallBack) {
        
        let piece = ArtPiece(id: "01", title: "adri Test", hasImage: false, imageURL: nil)
        
        let collection = [piece]
       
        completionHandler(collection)
    }
}


