//
//  PresenterTests.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 24/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class ViewControllerInterfaceMock: ViewControllerInterface {
    var isViewUpdated: Bool = false
    var collectionData: [ArtPiece]?
    
    func updateView(collection: [ArtPiece]?) {
        collectionData = collection
        isViewUpdated = true
    }
}

class PresenterTests: XCTestCase {

    // MARK: - Test variables.
    // Stands for: System under test
    var sut: Presenter!
    var viewMock: ViewControllerInterfaceMock!
    let dataManagerMock = DataManagerMock(d: DataProviderMock())
    
    // MARK: - Set up and tear down.

    override func setUp() {
        super.setUp()
        createSut()
    }
    
    func createSut() {
        sut = Presenter()
        viewMock = ViewControllerInterfaceMock()
        sut.view = viewMock
        sut.dataManager = dataManagerMock
    }
    
    override func tearDown() {
        releaseSut()
        super.tearDown()
    }
    
    func releaseSut() {
        sut = nil
    }
    
    // MARK: Intial tests
    
    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testIsViewUpdatedCalled() {
        // Test
        sut.getArtCollection()
        
        // Verify
        XCTAssertTrue(viewMock.isViewUpdated)
        XCTAssertEqual(viewMock.collectionData?.count, 1)
        XCTAssertEqual(viewMock.collectionData?.first?.id, "01")
        XCTAssertEqual(viewMock.collectionData?.first?.title, "adri Test")
    }
}
