//
//  RandomizeViewController.swift
//  testingTables
//
//  Created by Sophia M. Ardell on 5/2/16.
//  Copyright © 2016 Sophia M. Ardell. All rights reserved.
//

import UIKit

class RandomizeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DiningChoice.dataSource = self
        DiningChoice.delegate = self
        updatePlan()
        
        inviteLabel.setTitle(typeOfInvite, forState: UIControlState.Normal)

        // Do any additional setup after loading the view.
    }
    
    var typeOfInvite: String = "Random"

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let diningData = ["Moulton", "Thorne", "Pub", "either dining hall"]
    
    var plan: [String] = ["11:45 PM","11:45 PM","Moulton","1"]
    
    
    @IBOutlet weak var DiningChoice: UIPickerView!
    
    
    @IBOutlet weak var beginTime: UIDatePicker!
    @IBAction func beginTimeAction(sender: AnyObject) {
    
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        timeFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        timeFormatter.AMSymbol = "AM"
        timeFormatter.PMSymbol = "PM"
        let strTime =  timeFormatter.stringFromDate(beginTime.date)
        

        //only update if end time is later
        if (beginTime.date.compare(endTime.date)) != NSComparisonResult.OrderedDescending {
            plan[0] = strTime
            updatePlan()
            
        }
        
        
    }
    
    
    @IBOutlet weak var endTime: UIDatePicker!
    @IBAction func endTimeAction(sender: AnyObject) {
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        timeFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        timeFormatter.AMSymbol = "AM"
        timeFormatter.PMSymbol = "PM"
        let strTime =  timeFormatter.stringFromDate(endTime.date)
  
        //only update if end time is later
        if (beginTime.date.compare(endTime.date)) != NSComparisonResult.OrderedDescending {
            plan[1] = strTime
            updatePlan()
        }
        
  
    }
    
    
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperAction(sender: AnyObject) {
        stepperValue.text = "\(Int(stepper.value))"
        plan[3] = stepperValue.text!
        updatePlan()
    }
    
    
    
    @IBOutlet weak var inviteLabel: UIButton!
    @IBAction func sendInvite(sender: AnyObject) {
        actualSend()
    }
   
    func actualSend() -> [String] {
        return plan
    }
   
    
    
    @IBOutlet weak var currentPlan: UILabel!
    
    func updatePlan() {
        currentPlan.text = "Dining Location: " + plan[2] +
            "\nBegin time: " + plan[0]
            + "\nEnd time: " + plan[1] + "\nMax people: "
            + plan[3]
    }

    
    // MARK: - Delegates and data sources
    
        //data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diningData.count
    }
    
        //delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return diningData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        plan[2] = diningData[row]
        updatePlan()
    }

}
