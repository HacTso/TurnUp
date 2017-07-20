//
//  ShowDrinkViewController.swift
//  TurnUp
//
//  Created by Kris Cho on 19/7/2017.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import UIKit

class ShowDrinkViewController: UIViewController {

    var drinks = [NSDictionary]()
    
    
    @IBOutlet weak var showInstructionsLabel: UITextView!
    
    showInstructionsLabel.text = drinks[indexPath.row]["strInstructions"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        turnUpModel.getAlldrink(search: searchText, completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
//            data, response, error in
//            do {
//                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
//                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    
//                    if let results = jsonResult["drinks"] as? NSArray {
//                        
//                        let resultsArray = results as! [NSDictionary]
//                        self.drinks = resultsArray
//                        self.tableView.reloadData()
//                        print (self.drinks)
//                        
//                    }
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            } catch {
//                print("Something went wrong")
//            }
//        })
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    


}
