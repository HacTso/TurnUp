//
//  DrinkViewController.swift
//  TurnUp
//
//  Created by Kris Cho on 19/7/2017.
//  Copyright © 2017 Kris Cho. All rights reserved.
//

import UIKit

class DrinkViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var drinkPicker: UIPickerView!
    var selectedPick: String = ""
    @IBOutlet weak var searchField: UITextField!
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        
        
        
    }
    
    var pickerData = [String]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        let vc = nav.topViewController as! DrinkTableViewController
        vc.searchText = self.searchField.text!
        vc.searchType = self.selectedPick
        
            

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedPick = pickerData[row]
        print (selectedPick)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drinkPicker.delegate = self
        self.drinkPicker.dataSource = self
        pickerData = ["drink name", "ingredient"]
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

  
}
