//
//  UIImageView+URLImage.swift
//  UnitTestExample
//
//  Created by Adriana Ormaetxea on 11/04/2017.
//  Copyright © 2017 Mobiquity. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    public func imageFromUrl(urlString: String) {
        
        if let pictureURL = URL(string: urlString){ 
            // Creating a session object with the default configuration.
            // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
            let session = URLSession(configuration: .default)
            
            // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
            let downloadPicTask = session.dataTask(with: pictureURL) { (data, response, error) in
                // The download has finished.
                if let e = error {
                    print("Error downloading the picture: \(e)")
                } else {
                    // No errors found.
                    // It would be weird if we didn't have a response, so check for that too.
                    if let res = response as? HTTPURLResponse {
                        print("Downloaded the picture with response code \(res.statusCode)")
                        if let imageData = data {
                            DispatchQueue.main.async {
                                self.image =  UIImage(data: imageData)
                            }
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    } else {
                        print("Couldn't get response code for some reason")
                    }
                }
            }
            downloadPicTask.resume()
        }
    }
}
