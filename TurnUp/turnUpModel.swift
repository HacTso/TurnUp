//
//  turnUpModel.swift
//  TurnUp
//
//  Created by Kris Cho on 19/7/2017.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import Foundation


class turnUpModel {
    
    
    /*
     *   API CALLS
     */
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

    /*
     *   OUR OWN SERVER DB CALLS
     */
    
    static func getAllFavDrinks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "http://localhost:8000/drinks")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
    static func addDrinkToFavorites(drink: NSDictionary, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        var strDrink = String()
        var strIngredient1 = String()
        var strIngredient2 = String()
        var strIngredient3 = String()
        var strIngredient4 = String()
        var strIngredient5 = String()
        var strIngredient6 = String()
        var strMeasure1 = String()
        var strMeasure2 = String()
        var strMeasure3 = String()
        var strMeasure4 = String()
        var strMeasure5 = String()
        var strMeasure6 = String()
        var strIntructions = String()

        
        if let drink_name = drink["strDrink"] {
            strDrink = drink_name as! String
        }
        if let ingredient = drink["strIngredient1"] {
            strIngredient1 = ingredient as! String
        }
        if let ingredient = drink["strIngredient2"] {
            strIngredient2 = ingredient as! String
        }
        if let ingredient = drink["strIngredient3"] {
            strIngredient3 = ingredient as! String
        }
        if let ingredient = drink["strIngredient4"] {
            strIngredient4 = ingredient as! String
        }
        if let ingredient = drink["strIngredient5"] {
            strIngredient5 = ingredient as! String
        }
        if let ingredient = drink["strIngredient6"] {
            strIngredient6 = ingredient as! String
        }
        if let measure = drink["strMeasure1"] {
            strMeasure1 = measure as! String
        }
        if let measure = drink["strMeasure2"] {
            strMeasure2 = measure as! String
        }
        if let measure = drink["strMeasure3"] {
            strMeasure3 = measure as! String
        }
        if let measure = drink["strMeasure4"] {
            strMeasure4 = measure as! String
        }
        if let measure = drink["strMeasure5"] {
            strMeasure5 = measure as! String
        }
        if let measure = drink["strMeasure6"] {
            strMeasure6 = measure as! String
        }
        if let instructions = drink["strInstructions"] {
            strIntructions = instructions as! String
        }
        
        if let urlToReq = URL(string: "http://localhost:8000/newitem") {//url to request
            
            var request = URLRequest(url: urlToReq)
            //print ("OBJECTIVE: \(objective)")
            request.httpMethod = "POST"// Set the method to POST
            let bodyData = "strDrink=\(strDrink)&strIngredient1=\(strIngredient1)&strIngredient2=\(strIngredient2)&strIngredient3=\(strIngredient3)&strIngredient4=\(strIngredient4)&strIngredient5=\(strIngredient5)&strIngredient6=\(strIngredient6)&strMeasure1=\(strMeasure1)&strMeasure2=\(strMeasure2)&strMeasure3=\(strMeasure3)&strMeasure4=\(strMeasure4)&strMeasure5=\(strMeasure5)&strMeasure6=\(strMeasure6)&strInstructions=\(strIntructions)"
            request.httpBody = bodyData.data(using: .utf8)
            
            let session = URLSession.shared// Create the session
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            task.resume()
        }
    }
    
    static func removeDrink(id: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        if let urlToReq = URL(string: "http://localhost:8000/delete") {
            
            var request = URLRequest(url: urlToReq)
            request.httpMethod = "POST"
            
            let bodyData = "_id=\(id)" //{_id: 8493104s8293efs2f048ba}
            request.httpBody = bodyData.data(using: .utf8)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            task.resume()
        }
    }
    
}
