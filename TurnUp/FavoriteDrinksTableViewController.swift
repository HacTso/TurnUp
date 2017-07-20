//
//  FavoriteDrinksTableViewController.swift
//  TurnUp
//
//  Created by Placoderm on 7/19/17.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import UIKit

class FavoriteDrinksTableViewController: UITableViewController {

    var favorites = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //get drinks
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        turnUpModel.getAllFavDrinks(completionHandler: {
            data, response, error in
            
            do {
                if let d = data {
                    if let results = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? [NSDictionary] {
                        
                        print (results)
                        
                        self.favorites = results
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                
            } catch {
                print ("something went wrong retreiving fav drinks")
            }
        })
    }
    //swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let drink = favorites[indexPath.row]
        
        if let id = drink["_id"] {
            print (id)
            
            turnUpModel.removeDrink(id: id as! String, completionHandler: {
                data, response, error in
                
                do {
                    //                    DispatchQueue.main.async {
                    //                        self.items.remove(at: indexPath.row)
                    //                        self.tableView.reloadData()
                    //                    }
                } catch {
                    print ("Something went wrong")
                }
            })
        }
        self.favorites.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    //listen for user to click on accessory button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowFavDrink", sender: indexPath)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavDrinkCell", for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row]["strDrink"] as! String
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        let vc = nav.topViewController as! ShowFavViewController
        
        if let the_sender = sender as! IndexPath? {
            vc.drink = favorites[the_sender.row]
        }
        
    }
    @IBAction func unwindToFavDrinks(segue: UIStoryboardSegue) {
    }
    
}
