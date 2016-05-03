//
//  MealUpdateViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/1/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

@IBDesignable class MealUpdateViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    //include button here and call it pickerView
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerData: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerData = ["Moulton", "Thorne", "Both Dining Halls", "Pub", "No preference"]
        
        //mealOnePicker?.delegate = self
        //self.mealOnePicker?.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //number of colums of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //the data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    



}
