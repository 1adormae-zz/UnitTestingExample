//
//  NetworkDataProvider.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 10/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation

typealias CallBack = ((Any?) -> Void)

class NetworkDataProvider: DataProvider{
    
    func getCollection(completionHandler: @escaping CallBack)  {
        let todoEndpoint: String = "https://www.rijksmuseum.nl/api/nl/collection?q=rembrant&key=uQIiUF3Q&format=json"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            completionHandler(nil)
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let session = URLSession.shared
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            guard let responseData = data  else{
                completionHandler(nil)
                return
            }
            do {
                let json =   try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                guard let collectionDictionary = json["artObjects"] as? [[String: Any]] else{
                    completionHandler(nil)
                    return
                }
                completionHandler( artCollectionMapper(collectionJson: collectionDictionary))
                
            } catch{
                completionHandler(nil)
            }
        })
        task.resume()
    }
}
