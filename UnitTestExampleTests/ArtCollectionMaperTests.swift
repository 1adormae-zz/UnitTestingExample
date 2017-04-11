//
//  ArtCollectionMaperTests.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 11/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import XCTest

class ArtCollectionMaperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArtCollectionMapper() {
        
        
        let mockDictionary = generateJson(fromFile: "collection")
        if let mockPiecesDictionary = mockDictionary as? [[String:Any]]  {
             let arrayArtPieces = artCollectionMapper(collectionJson: mockPiecesDictionary)
          XCTAssertNotNil(arrayArtPieces)
          XCTAssertEqual(arrayArtPieces.count ,3)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}




public func generateJson(fromFile: String) -> Any? {
    do {
        if let file = Bundle.main.url(forResource: fromFile, withExtension: "json") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: Any] {
                // json is a dictionary
                print(object)
                return json
            } else if let object = json as? [Any] {
                // json is an array
                print(object)
                return json
            } else {
                print("JSON is invalid")
                return nil
            }
        } else {
            print("no file")
            return nil
        }
    } catch {
        print(error.localizedDescription)
        return nil
    }
}
