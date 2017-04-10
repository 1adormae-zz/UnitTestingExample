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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testInitDataManager() {
        
        let dataManager = DataManager(d: MockDataProvider())
        XCTAssertNotNil(dataManager)
    }

    
    func testRetrieveCollection() {
        
        let dataManager = DataManager(d: MockDataProvider())
        let collection = dataManager.retrieveCollection()
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

class MockDataProvider : DataProvider
{
    func getCollection() -> [String : Any] {
        let collection = ["001": "NightsWatch"]
        return collection
    }
}


