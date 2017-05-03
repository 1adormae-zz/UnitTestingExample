//
//  DataProviderMock.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 24/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation
@testable import UnitTestExample

class DataProviderMock: DataProviderProtocol {
    func getCollection(completionHandler: @escaping CallBack) {
        let piece = ArtPiece(id: "01", title: "adri Test", hasImage: false, imageURL: nil)
        let collection = [piece]
        
        completionHandler(collection)
    }
}
