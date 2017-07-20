//
//  turnUpModel.swift
//  TurnUp
//
//  Created by Kris Cho on 19/7/2017.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import Foundation


class turnUpModel {
    
    
    //request drinks by drink name
    static func getAlldrink (search: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let clean_search = search.replacingOccurrences(of: " ", with: "_")
        
        if let urlToReq = URL(string: "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(clean_search)") {
            
            let request = URLRequest(url: urlToReq)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            
            task.resume()
            
        } else {
            print ("something is horribly wrong with getting the drink url")
        }
        
    }
    
    //request drinks by ingredient
    static func getAllingredient (search: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let clean_search = search.replacingOccurrences(of: " ", with: "_")
        
        if let urlToReq = URL(string: "http://www.thecocktaildb.com/api/json/v1/1/search.php?i=\(clean_search)") {
            
            let request = URLRequest(url: urlToReq)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            
            task.resume()
            
        } else {
            print ("something is horribly wrong with getting the drink by ingredient url")
        }
        
    }

    
    
}
