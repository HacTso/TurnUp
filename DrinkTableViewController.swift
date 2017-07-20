//
//  DrinkTableViewController.swift
//  TurnUp
//
//  Created by Kris Cho on 19/7/2017.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import UIKit

class DrinkTableViewController: UITableViewController {
    
    var searchText: String = ""
    var searchType: String = ""
    var drinks = [NSDictionary]()
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        turnUpModel.getAlldrink(search: searchText, completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {

                    if let results = jsonResult["drinks"] as? NSArray {
                        
                        let resultsArray = results as! [NSDictionary]
                        self.drinks = resultsArray
                        self.tableView.reloadData()
                        //print (self.drinks)
                        
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    
    //listen for user to click on accessory button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowOneDrink", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        let vc = nav.topViewController as! ShowDrinkViewController
        
        if let the_sender = sender as! IndexPath? {
            vc.drink = drinks[the_sender.row]
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        print ("here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath)
        cell.textLabel?.text = drinks[indexPath.row]["strDrink"] as! String!
        
        return cell
    }
    
//    @IBAction func unwindToDrinkSearchListViewController (segue: UIStoryBoardSegue) {
//        
//    }



}
