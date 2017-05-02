//
//  DataManagerMock.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 24/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation
@testable import UnitTestExample

class DataManagerMock: DataManager {
    override func retrieveCollection(completionHandler: @escaping CallBack) {
        dataProvider.getCollection { response in
            completionHandler(response)
        }
    }
}
