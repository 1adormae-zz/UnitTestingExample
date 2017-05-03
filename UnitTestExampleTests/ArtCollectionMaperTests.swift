//
//  ArtCollectionMaperTests.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 11/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class ArtCollectionMaperTests: XCTestCase {
    
    func testArtCollectionMapper() {
        let mockDictionary = generateJson(fromFile: "Collection")
        XCTAssert(mockDictionary is [String: Any])
        if let mockDic = mockDictionary as? [String: Any]{
            XCTAssert(mockDic["artObjects"] is [[String:Any]])
            if let arrayOfDict = mockDic["artObjects"] as? [[String:Any]]{
            let arrayArtPieces = artCollectionMapper(collectionJson: arrayOfDict)
            XCTAssertNotNil(arrayArtPieces)
            XCTAssertEqual(arrayArtPieces.count ,3)
            XCTAssertNotNil(arrayArtPieces[1].title)
            }}
    }
    
}

// TODO: Fix this Ata(self)
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
